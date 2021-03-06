
require 'csv'
require 'ft_modules'

class Value < Item

   include FtUtils




   def after_initialize()
     begin
       self.created_at = Time.now   unless self.attribute_present?('created_at')
       self.updated_at = Time.now   unless self.attribute_present?('updated_at')
     rescue
     end
   end

   def display_name
      return "Value"
   end

   def self.display_name
      return "Value"
   end

   def ctrlr_name
      return "values"
   end

   def self.iattr_name
      return "name"
   end

   def iattr_name
      return "name"
   end

   def iname
      return "" if self.name.nil? 
      return self.name.to_s
   end

   def qname
      q_name = iname()
      q_name = owner.qname() + " > " + q_name if owner
      return q_name
   end

   def sname
       return self.qname
   end

   def container_qname
      return (owner && owner.qname) || ""
   end

   def container_obj
      return nil || owner
   end

  def move_targets()
    targets = InfoNode.find(:all)
    targets = targets - [self.container_obj()] if self.container_obj()
    return targets
  end

   def get_children
      # override this method to return this object's sub-items - used in "tree_for" helper

      # return [ { :title => "Title", :items => [ item, item, ... ] }, ... ] to allow the tree to show multiple titled lists of sub-items
      # return [ item, item, ... ] to allow the tree to show a simple indented list of sub-items without a title

      sub_items = [ ]
      sub_items << { :title => "Property Attrs", 
                     :items => property_attrs.find(:all,  # :select =>"id,name",
                                   :order => 'name' ) }
      return sub_items
   end



    # runtime metadata support methods

    def self.attr_type_info(attr_name=nil)
        unless defined?(@@attr_info)
          @@attr_info = {}
          @@attr_info['name'] = { :datatype => 'string', :modifier => '', :length => 120, :is_identity_attr => true, :default => '', :mode => 'rw' }
          @@attr_info['created_at'] = { :datatype => 'DateTime'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['updated_at'] = { :datatype => 'DateTime'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['sort_code'] = { :datatype => 'int'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
        end
        return attr_name.nil? ? @@attr_info : @@attr_info[attr_name.to_s]
    end

    def self.attr_lengths
      { 'name' => 120 }
    end

    def self.value_attrs
      ["name","created_at","updated_at","sort_code"]
    end

    def self.foreign_key_attrs
       ["owner"]
    end

    def self.filter_attrs(attrs)
      valid_keys = self.value_attrs + self.foreign_key_attrs.collect{|fka| foreign_key_attr_info(fka)[:foreign_key]}
      return attrs.reject{|k,v| ! valid_keys.include?(k.to_s)}
    end

    def self.foreign_key_attr_info(fk_attr_name=nil)
      unless defined?(@@fk_attr_info)
        @@fk_attr_info = { }
        @@fk_attr_info['owner'] = {:datatype => "Item", :foreign_key => "owner_info_node_id"}
      end

      return fk_attr_name.nil? ? @@fk_attr_info : @@fk_attr_info[fk_attr_name.to_s]
    end

    def self.get_form_fields()
       ["name","sort_code"]
    end

    def self.csv_header_row
      (value_attrs + foreign_key_attrs + []).join(",")
    end

    def self.load_csv_file(filename)
        self.load_csv_str(File.read(filename))
    end

    def self.load_csv_str(csv_str)
        rows = load_csv_data(csv_str)
        update_table_entries(rows)
    end

    def self.load_csv_data(csv_str)
        headers = Array.new
        rows = Array.new
        row_no = 1

        cname = String.new
        cval = String.new

        records = CSV.parse(csv_str) || []

        records.each do |row|
            if row
                if row_no == 1
                    headers = row.collect{|v| v.to_s.strip.gsub(/\s+/,"").underscore}
                else
                    row_data = Hash.new("")
                    col_no = 0
                    row.each { |val|
                      if ! headers[col_no].to_s.empty?
                        cname = headers[col_no]
                        cval = val.to_s.gsub("\"","").strip

                        limit = attr_lengths[cname]
                        cval = cval[0...limit] if limit

                        begin
                          row_data[cname.to_sym] = cval.gsub(/[\x80-\xff]/,'')
                        rescue
                        end
                      end
                      col_no = col_no + 1
                    }
                    rows << row_data
                end

                row_no = row_no + 1
            end
        end

        return rows 
    end

    def self.update_table_entries(rows)
      rows.each { |row|
        unless row[:name].to_s.empty? then
          obj = find_or_create_by_name(row[:name])

          attrs = row.clone
          attrs.delete_if { |k,v| (! self.value_attrs.member? k.to_s) || v.size == 0 }
          obj.attributes = attrs

          obj.owner = InfoNode.find_or_create_by_name(row[:owner]) unless row[:owner].to_s.empty?

          obj.save()
        end # if identity attr supplied
      }
    end

 public


  # returns the next/prev item given its context of ownership: a) global or b) as a contained item of another object

  def next_at_top
    item = Value.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["name > ? AND owner_info_node_id is null", self.name] )
    item = Value.find(:first, :order => FtUtils.quoted_name('name'), :conditions => "owner_info_node_id is null") if item.nil? 
    return item
  end

  def prev_at_top
    item = Value.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["name < ? AND owner_info_node_id is null", self.name] )
    item = Value.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => "owner_info_node_id is null") if item.nil? 
    return item
  end

  def next_item
    return next_at_top() unless self.container_obj()
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["name > ? AND type = ?", self.name, "Value"] )
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["type = ?", "Value"]) if item.nil? 
    return item
  end

  def prev_item
    return prev_at_top() unless self.container_obj()
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["name < ? AND type = ?", self.name, "Value"] )
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["type = ?", "Value"]) if item.nil? 
    return item
  end

  def self.items_for_index
    return Value.find(:all, :order => 'name')
  end

  # ---

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT value.name as #{FtUtils.quoted_name('name')},
              value.created_at as #{FtUtils.quoted_name('created_at')},
              value.updated_at as #{FtUtils.quoted_name('updated_at')},
              value.sort_code as #{FtUtils.quoted_name('sort_code')},
              owner.name as #{FtUtils.quoted_name('owner')},
              owner.id as owner_info_node_id,
              value.type as type,
              value.id as id
          FROM
              #{FtUtils.quoted_name('items')} AS #{FtUtils.quoted_name('value')}
              left outer join #{FtUtils.quoted_name('items')} as #{FtUtils.quoted_name('owner')} on value.owner_info_node_id = owner.id
          WHERE 
              value.type = "Value"
          #{cond ? ("AND "+cond.to_s) : ""}
          ) AS values
          EOS
  end

  def self.query_specs

    # override this method to define query specs - an example is provided
    #   :title - the query title for display
    #   :sql   - the query
    #   :cols  - array mapping out the order in which the columns should appear left-to-right
    #   :where - an expression to place after a where clause in the query
    #   :order_by - comma separated list of column names in array brackets [ ... ]

    @@default_query = default_query()

    @@query_specs = {
      "list_all" => 
        { :title => "List of "+"Value".pluralize,
          :sql  => "SELECT * FROM #{@@default_query}",
          :cols => Value.value_attrs.concat(Value.foreign_key_attrs),
          :where => "name IS NOT NULL",
          :order_by => ['name']
        },
    }

    # set the name of the query in each query spec
    @@query_specs.each{|k,v| v[:name] = k}

    return @@query_specs
  end

  # used in showing query results; gets around method name collisions; returns derived attr values
  # use the least expensive means for html contexts (lists and queries); do full eval for others (e.g. csv)
  def get_attr_val(ft_col_name,ctx='html')
    attr_info = Value.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone 
    else
      return self.read_attribute(ft_col_name)
    end
  end

  def self.find(*args)
    return Item.find(args[0]) if (args[0].instance_of?(String) || args[0].instance_of?(Array))

    types_str = "(type = 'Value')"
    
    if args.size == 2 && args[0] == :all && args[1].instance_of?(Hash)
      cond_array = [types_str]
      if args[1][:conditions]
        cond_array = [ args[1][:conditions] ].flatten
        cond_array[0] = types_str + " and " + cond_array[0]
      end
      args[1] = args[1].merge(:conditions => cond_array)
      return Item.find(:all,args[1]) 
    end

    # puts "\n" + args.inspect

    return super
  end

  def self.exists?(id)
    return Item.exists?(id)
  end

  def self.delete(id)
    return Item.destroy(id)
  end

  def self.choices_for(obj,rel_name=nil)
    return Value.find(:all, :order => 'name')
  end

  def before_destroy
  end

#BEGIN-UID.usermethods

#END-UID.usermethods

end
