
require 'csv'
require 'ft_modules'

class InfoNode < Item

   include FtUtils


   has_many             :items, :class_name => "Item", :foreign_key => "owner_info_node_id"
   has_and_belongs_to_many :ref_targets, :class_name => "Item", :join_table => "info_nodes_ref_targets_items", :foreign_key => "info_node_src_id", :association_foreign_key => "item_dest_id"



   def after_initialize()
     begin
       self.created_at = Time.now   unless self.attribute_present?('created_at')
       self.updated_at = Time.now   unless self.attribute_present?('updated_at')
     rescue
     end
   end

   def display_name
      return "Info Node"
   end

   def self.display_name
      return "Info Node"
   end

   def ctrlr_name
      return "info_nodes"
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
      sub_items << { :title => "Items", 
                     :items => items.find(:all,  # :select =>"id,name",
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
          @@attr_info['view'] = { :datatype => 'text', :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
        end
        return attr_name.nil? ? @@attr_info : @@attr_info[attr_name.to_s]
    end

    def self.attr_lengths
      { 'name' => 120 }
    end

    def self.value_attrs
      ["name","created_at","updated_at","sort_code","view"]
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
       ["name","sort_code","view"]
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
    item = InfoNode.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["name > ? AND owner_info_node_id is null", self.name] )
    item = InfoNode.find(:first, :order => FtUtils.quoted_name('name'), :conditions => "owner_info_node_id is null") if item.nil? 
    return item
  end

  def prev_at_top
    item = InfoNode.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["name < ? AND owner_info_node_id is null", self.name] )
    item = InfoNode.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => "owner_info_node_id is null") if item.nil? 
    return item
  end

  def next_item
    return next_at_top() unless self.container_obj()
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["name > ? AND type = ?", self.name, "InfoNode"] )
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["type = ?", "InfoNode"]) if item.nil? 
    return item
  end

  def prev_item
    return prev_at_top() unless self.container_obj()
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["name < ? AND type = ?", self.name, "InfoNode"] )
    item = self.container_obj().items.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["type = ?", "InfoNode"]) if item.nil? 
    return item
  end

  def self.items_for_index
    return InfoNode.find(:all, :order => 'name')
  end

  # ---

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT info_node.name as #{FtUtils.quoted_name('name')},
              info_node.created_at as #{FtUtils.quoted_name('created_at')},
              info_node.updated_at as #{FtUtils.quoted_name('updated_at')},
              info_node.sort_code as #{FtUtils.quoted_name('sort_code')},
              info_node.view as #{FtUtils.quoted_name('view')},
              owner.name as #{FtUtils.quoted_name('owner')},
              owner.id as owner_info_node_id,
              info_node.type as type,
              info_node.id as id
          FROM
              #{FtUtils.quoted_name('items')} AS #{FtUtils.quoted_name('info_node')}
              left outer join #{FtUtils.quoted_name('items')} as #{FtUtils.quoted_name('owner')} on info_node.owner_info_node_id = owner.id
          WHERE 
              info_node.type = "InfoNode"
          #{cond ? ("AND "+cond.to_s) : ""}
          ) AS info_nodes
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
        { :title => "List of "+"Info Node".pluralize,
          :sql  => "SELECT * FROM #{@@default_query}",
          :cols => InfoNode.value_attrs.concat(InfoNode.foreign_key_attrs),
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
    attr_info = InfoNode.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone 
    else
      return self.read_attribute(ft_col_name)
    end
  end

  def self.find(*args)
    return Item.find(args[0]) if (args[0].instance_of?(String) || args[0].instance_of?(Array))

    types_str = "(type = 'InfoNode')"
    
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
    return InfoNode.find(:all, :order => 'name')
  end

  def before_destroy
  end

#BEGIN-UID.usermethods

    def node_attributes
      return items.find(:all, :order => 'name', :conditions => ["type = ?", "Attribute"])
    end

    def node_values
      return items.find(:all, :order => 'name', :conditions => ["type = ?", "Value"])
    end

    def node_sections
      return items.find(:all, :order => 'sort_code', :conditions => ["type = ?", "Section"])
    end


    def sub_nodes
      return items.find(:all, :order => 'name', :conditions => ["type = ?", "InfoNode"])
    end

    def refs
      return ref_targets.find(:all, :order => 'name')
    end

    def in_refs
      return ref_sources.find(:all, :order => 'name')
    end


    def parent
      return self.owner
    end

    def children
      return self.sub_nodes.concat(self.refs)
    end

    # ---

    def get_move_targets
      targets = InfoNode.get_nodes_in_domain(self.get_domain)

      targets.delete self
      targets.delete self.parent if self.parent

      mine = self.descendants
      targets = targets - mine

      return targets
    end

    def get_subnode_by_name(nname)
      name = nname.to_s
      return self.children.find{|n| n.name == name}
    end

    def get_subnodes_of(anchor)
      if anchor.instance_of?(String)
        nodes = self.children.select{|sn| sn.name == anchor}
      elsif anchor.instance_of?(InfoNode)
        nodes = [anchor]
      elsif anchor.instance_of?(Array)
        nodes = anchor
      else
        return []
      end

      inner_nodes = nodes.collect{|n| n.children}.flatten
      return inner_nodes.uniq
    end

    # --

    def self.get_referrers_to(nodes)
      nodes = [nodes] if nodes.instance_of?(InfoNode)
      refing_nodes = nodes.collect{|n| n.in_refs}.flatten.uniq
      return refing_nodes
    end

    def self.get_parents_of(nodes)
      nodes = [nodes] if nodes.instance_of?(InfoNode)
      parents = nodes.collect{|n| n.parent}.uniq
      return parents
    end

    def self.get_children_of(nodes)
      nodes = [nodes] if nodes.instance_of?(InfoNode)
      kids = nodes.collect{|n| n.children}.flatten.uniq
      return kids
    end

    def self.domain_tag(domain)
      return "_domain_#{domain.id.to_s}"
    end

    def self.get_nodes_in_domain(domain)
      return [domain] + Item.find_all_by_tag(domain_tag(domain))
    end

    def self.get_nodes_by_name(domain,node_name)
      nodes = InfoNode.find(:all, :conditions => "type = 'InfoNode' and name = '#{node_name}'")
      nodes = nodes.select{|n| n.get_domain == domain}
      return nodes

      # return InfoNode.get_nodes_in_domain(domain).collect{|n| n.name == node_name}
    end

    def self.get_node_by_name(top,name)
      return nil if ! top
      return top if top.name == name

      if top.is_domain?
        matches = get_nodes_in_domain(top).find_all{|n| n.name == name}
      else
        matches = top.descendants.find_all{|n| n.name == name}
      end

      # of the nodes found with that name, return the highest one in the hierarchy
      node = nil
      for match in matches do
        node = match if node.nil? || match.depth < node.depth
      end

      return node
    end

    def depth
      n = self; d = 0
      while n = n.parent do
        d = d + 1
      end
      return d
    end

    def self.get_node_by_qname(top,qname)
      return nil if ! top
      return top if top.name == qname

      return top.descendants.find{|n| n.qname.include?(qname)}
    end


    # -- Attributes

    def get_attr(aname)
      for attr in self.node_attributes do
        return attr if attr.name == aname
      end
      return nil
    end

    def get_attr_value(aname,def_val="")
      @attr_vals = {} if ! @attr_vals

      attr_val = @attr_vals[aname]
      return attr_val if attr_val

      attr = get_attr(aname)
      attr_val = attr ? attr.value.to_s : def_val
      @attr_vals[aname] = attr_val
      return attr_val
    end

    def set_attr(aname,avalue)
      attr = get_attr(aname)
      if attr
        attr.update_attributes(:value => avalue)
      else
        attr = Attribute.create(:name => aname, :value => avalue)
      end
      @attr_vals[aname] = avalue if @attr_vals
    end


    # -- Identity

    def self.top_level_items
      return InfoNode.find(:all, :conditions => "owner_info_node_id is null")
    end

    def clear_names
      @q_name = nil
      @nav_name = nil
    end

    def rename_to(new_name)
      self.name = new_name
      clear_names
    end

    def move_to(target)
      target.items << self
      clear_names
    end

    def apply_container_tags(cnode)
      return if cnode.nil?

      rtags = cnode.tag_values.select{|tv| tv.include?("_apply_tag_")}
      rtags = rtags.collect{|tv| tv.gsub("_apply_tag_","")}

      for tv in rtags
        self.set_tag(tv)
      end
    end

    def qname
      return @q_name if @q_name

      @q_name = self.iname.clone
      @q_name = self.owner.qname() + "/" + @q_name if self.owner
      return @q_name
    end

    def nav_name
      return @nav_name if @nav_name

      @nav_name = iname.clone
      @nav_name = container_obj.iname + "/" + iname if container_obj
      return @nav_name
    end

    def name_matches(targ_name)
      return qname[-targ_name.length..-1] == targ_name if targ_name.include?("/")
      return name == targ_name
    end

    # -- Top level and subnodes

    def is_domain?
      return container_obj.nil?
    end

    def self.get_domains
      return Item.find_by_sql("select * from items where type = 'InfoNode' and owner_info_node_id is null")
    end

    def get_domain
      return @top if @top

      @top = self
      higher = @top.container_obj
      while higher do
        @top = higher
        higher = @top.container_obj
      end
      return @top
    end

    def descendants
      subs = self.sub_nodes
      for sub in self.sub_nodes do
        subs = subs.concat sub.descendants
      end

      return subs
    end

    # ---

    def get_templates
      templates = []
      tem_tag_names = self.tag_values.select{|tv| tv[0,3] == "is_"}.collect{|tv| tv.gsub("is_","as_")}
      for tem_tag_name in tem_tag_names do
        tnodes = Item.find_all_by_tag(tem_tag_name).select{|n| n.get_domain == self.get_domain}
        templates = templates.concat(tnodes)
      end
      return templates
    end

    def apply_templates
      tnodes = get_templates
      for tnode in tnodes do
        self.apply_template tnode
      end
    end

    def apply_template(tnode)
      return if tnode == self

      self.update_names_and_tags(self.items)
      self.link_existing_items_to(tnode)

      # -- tags --

      _tags = tnode.tag_values.select{|tv| tv[0,1].include?("_")}
      for tv in _tags do
        self.set_tag tv
      end

      # -- named values --

      my_attr_names = self.node_attributes.collect{|ni| ni.name}
      tem_attrs = tnode.node_attributes

      for tem_attr in tem_attrs.select{|ta| ! my_attr_names.include?(ta.name)} do
        named_item = Attribute.create({:name => tem_attr.name, :value => ''})
        named_item.set_prop('derived_from',tem_attr.id)
        self.items << named_item
      end

      # -- doc fields --

      my_doc_names = self.node_sections.collect{|ni| ni.name}
      tem_docs = tnode.node_sections

      for tem_doc in tem_docs.select{|td| ! my_doc_names.include?(td.name)} do
        doc_item = Section.create({:name => tem_doc.name, :body => tem_doc.body})
        doc_item.set_prop('derived_from',tem_doc.id)
        self.items << doc_item
      end

      # -- subelements --

      my_subs_names = self.sub_nodes.collect{|ni| ni.name}
      tem_subs = tnode.sub_nodes

      for tem_sub in tem_subs.select{|ts| ! my_subs_names.include?(ts.name)} do
        new_sub = InfoNode.create({:name => tem_sub.name})
        new_sub.set_prop('derived_from',tem_sub.id)
        self.items << new_sub
        new_sub.add_tags(tem_sub.user_tags.select{|t| t.name[0,3] != 'as_'})
        new_sub.apply_template(tem_sub)
      end
    end

    def update_names_and_tags(all_items)
      for item in all_items do
        if progen_id = item.get_prop('derived_from')
          if Item.exists?(progen_id.value)
            progen = Item.find(progen_id.value)
            if (item.name != progen.name)
              item.name = progen.name
              item.save
            end
            item.add_tags(progen.user_tags.select{|t| t.name[0,3] != 'as_'})
          else
              # remove the attr, but keep the derived item
            item.remove_attr('derived_from')
          end
        end
      end
    end

    def link_existing_items_to(tnode)
      attr_hash = {}
      tnode.node_attributes.each{|v| attr_hash[v.name] = v}
      for nitem in self.node_attributes do
        corr_item = attr_hash[nitem.name]
        nitem.set_prop('derived_from',corr_item.id) if corr_item
      end

      doc_hash = {}
      tnode.node_sections.each{|v| doc_hash[v.name] = v}
      for nitem in self.node_sections do
        corr_item = doc_hash[nitem.name]
        nitem.set_prop('derived_from',corr_item.id) if corr_item
      end

      sub_hash = {}
      tnode.sub_nodes.each{|v| sub_hash[v.name] = v}
      for nitem in self.sub_nodes do
        corr_item = sub_hash[nitem.name]
        nitem.set_prop('derived_from',corr_item.id) if corr_item
      end
    end

    def has_a_view?
      return true if ! self.view.to_s.empty?

      tems = get_templates
      for tem in tems do
        return true if ! tem.view.to_s.empty?
      end

      return false
    end

    def get_view_text
      return self.view.to_s if ! self.view.to_s.empty?

      tems = get_templates
      for tem in tems do
        return tem.view.to_s if ! tem.view.to_s.empty?
      end

      return ""
    end

    def get_children
      return sub_nodes
    end

    def self.elements_with_all_tags(domain, tags)
      return [] if tags.nil? || tags.size == 0

      qtags         = tags.split(/\s+/).collect{|t| "'#{t}'"}.sort.uniq
      tag_objs      = Tag.find_by_sql("select * from tags where name in (#{qtags.join(',')})")

      items_arr_arr = tag_objs.collect{|t| t.items.find(:all)}
      items_w_tags  = items_arr_arr.shift
      if items_w_tags then
        for items_arr in items_arr_arr do
          items_w_tags = items_w_tags & items_arr
        end
        items_w_tags = items_w_tags.find_all{|x| x.get_domain == domain}
      else
        return []
      end

#      items = InfoNode.get_nodes_in_domain(domain)
#      targs = items.find_all{|x| x.has_all_tags?(tags)}
#      return targs
    end

    def self.node_is_member?(domain,node_id)
      return false if ! InfoNode.exists?(node_id)

      node = InfoNode.find(node_id)
      return true if node.id == domain.id

      return node.has_tag?(self.domain_tag(domain))
    end


#END-UID.usermethods

end
