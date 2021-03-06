class ItemsController < ApplicationController

  def index
    prepare_list()
  end

  def apply_to_checked_items
    if params[:action_to_perform] == 'Delete'    
        Item.destroy(params[:delchk].keys) if params[:delchk] && params[:delchk].keys.size > 0
    end 

    redirect_to :back
  end

  def replace_column_value
    if params[:old_value].empty?
        where_clause = "#{params[:field]} is null or #{params[:field]} = ''" 
    elsif params[:old_value].include?("%") || params[:old_value].include?("*")
        where_clause = "#{params[:field]} like '#{params[:old_value].gsub("*","%").strip}'"
    else
        where_clause = "#{params[:field]} = '#{params[:old_value].strip}'"
    end
    Item.update_all("#{params[:field]} = '#{params[:new_value].strip}'", where_clause)
    redirect_to :back
  end

  def delete_matching_rows
    if params[:value].empty?
        where_clause = "#{params[:field]} is null or #{params[:field]} = ''" 
    elsif params[:value].include?("%") || params[:value].include?("*")
        where_clause = "#{params[:field]} like '#{params[:value].gsub("*","%").strip}'"
    else
        where_clause = "#{params[:field]} = '#{params[:value].strip}'"
    end
    Item.delete_all(where_clause)
    redirect_to :back
  end

  def list_with_sort
    redirect_to params.merge(:action => 'list')
  end

  def list_without_sort
    params[:sort_field] = params[:sort_field2] = params[:sort_field3] = nil
    redirect_to params.merge(:action => 'list')
  end

  def list_with_filter
    params[:page] = "1"
    redirect_to params.merge(:action => 'list')
  end

  def list_without_filter
    params[:page] = "1"
    params[:search_field] = params[:search_field2] = params[:search_field3] = nil
    params[:search_str] = params[:search_str2] = params[:search_str3] = nil
    redirect_to params.merge(:action => 'list')
  end

  def list_by_page
    redirect_to params.merge(:action => 'list')
  end

  def block_list_by_page
    redirect_to params.merge(:action => 'block_list')
  end

  def list
    prepare_list()
  end

  def block_list
    prepare_list()
  end

  def new

    @ft_subject = "Item"
    @ft_activity = "New"

    if params && params[:redirect] 
        session[:post_create_redirect] = params[:redirect]
    end

    @owner = Item.find(params[:owner_id]) if params[:owner_id]
    @new_obj.owner = @owner
  end

  def set_context(load_related=true)
    @item = Item.find(params[:id])

    @ft_subject = "Item"
    @ft_activity = @item.iname
    
    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

    @order_field = get_order_field(params,'item','property_attrs','name')
    @id_set = @item.send("#{'property_attrs'.singularize}_ids").concat(["0"]).join(",")
    @property_attrs = Property.find_by_sql(%Q~select * from #{Property.default_query("property.id in (#{@id_set})")} order by #{quoted_name(@order_field)}~)

    @owner = @item.owner

    @order_field = get_order_field(params,'item','ref_sources','name')
    @id_set = @item.send("#{'ref_sources'.singularize}_ids").concat(["0"]).join(",")
    @ref_sources = InfoNode.find_by_sql(%Q~select * from #{InfoNode.default_query("info_node.id in (#{@id_set})")} order by #{quoted_name(@order_field)}~)

    @order_field = get_order_field(params,'item','tags','name')
    @id_set = @item.send("#{'tags'.singularize}_ids").concat(["0"]).join(",")
    @tags = Tag.find_by_sql(%Q~select * from #{Tag.default_query("tag.id in (#{@id_set})")} order by #{quoted_name(@order_field)}~)

  end

  def show
    set_context()
    redirect_to( :controller => @item.ctrlr_name, :action => 'show', :id => @item.id ) unless @item.ctrlr_name == "ItemsController"
  end

  def show_properties
    set_context()
    render :partial => 'show_properties'
  end

  def show_related
    set_context()
    render :partial => 'show_related'
  end

  def get_related
    set_context()
    if params[:relname].to_s.underscore == 'property_attrs' then
      render :xml => @item.property_attrs.find(:all)
      return
    end
    render :xml => { :message => "No such related items" }.to_xml(:root => "error") 
  end

  def show_as_doc
    set_context()
    redirect_to( :controller => @item.ctrlr_name, :action => 'show_as_doc', :id => @item.id ) unless @item.ctrlr_name == "ItemsController"
  end

  def edit
    set_context()
    redirect_to( :controller => @item.ctrlr_name, :action => 'edit', :id => @item.id ) unless @item.ctrlr_name == "ItemsController"
  end

  # returns true to indicate redirection has been queued
  def update_aggregator(new_obj,params)
    @owner = Item.find(params[:owner_id]) if params[:owner_id] && params[:owner_id].length > 0
    if @owner 
      @owner.items << new_obj
      unless session[:post_create_redirect]
        if ! params[:commit].to_s.include?("Another")
          redirect_to :controller => @owner.ctrlr_name, :action => 'edit', :id => @owner.id, :anchor => "items"
        else
          redirect_to :action => 'new', :params => { :owner_id => @owner.id }
        end
        return true
      end
    end
    return false
  end

  def sanitize_params(hk)
    params[hk].each{|k,v| params[hk][k] = v.gsub("-- select --","")}  if params[hk]
    params[hk].each{|k,v| params[hk][k] = v.gsub(/HH:MM.*/,"")}       if params[hk]
  end

  def update
    @updated_obj = @item = Item.find(params[:id])
    sanitize_params(:item)

    if ! ok_to_add_or_update?
      flash[:notice] = 'Not updated. ' + @reason.to_s
      @ft_subject = "Item"
      @ft_activity = "Edit"
      redirect_to :action => 'edit', :id => @item and return
    end 

      respond_to do |format|
      if @item.update_attributes(params[:item])

        if session[:post_update_redirect] then
          redirect_to session[:post_update_redirect]
          session[:post_update_redirect] = nil
          return
        end

        format.xml  { head :ok }
        format.html {
          flash[:notice] = 'Item was successfully updated.'
          redirect_to :action => 'show', :id => @item
        }
      else
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
        format.html { 
          redirect_to :action => 'edit', :id => @item
        }
      end
    end
  end

  def ok_to_add_or_update?
    if params[:item][:name].to_s.empty?
      @reason = 'The name field can not be blank.'
      return false
    end
    return true
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.xml  { head :ok }
    end
  end


  # -------------------------------------------------

  def quick_add_property_attrs
    @item = Item.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_properties = @item.property_attrs.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Property.find_or_create_by_name(str_name)
        @item.property_attrs << new_obj unless existing_properties.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @item.id
  end


  # -------------------------------------------------

  def add_to_ref_sources
    @ft_subject = "Item"
    @ft_activity = "Select Info Node".pluralize

    @item = Item.find(params[:id])
    @info_nodes = InfoNode.choices_for(@item,'ref_sources')
    @info_nodes = @info_nodes - [ @item ]
    @my_ref_sources = @item.ref_sources
    @info_nodes.delete_if{|a| @my_ref_sources.include?(a)}
  end
  
  def update_ref_sources
    @item = Item.find(params[:id])
    @ref_sources = [ InfoNode.find(params[:info_node_ids]) ] if params[:info_node_ids]
    @item.ref_sources << @ref_sources if @ref_sources
    redirect_to :controller => @item.ctrlr_name, :action => 'edit', :id => @item, :anchor => 'ref_sources'
  end

  def remove_from_ref_sources
    @item = Item.find(params[:id])
    @ref_sources = InfoNode.find(params[:info_node_id])
    @item.ref_sources.delete @ref_sources
    redirect_to :controller => @item.ctrlr_name, :action => 'edit', :id => @item, :anchor => 'ref_sources'
  end

  def quick_add_ref_sources
    @item = Item.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_info_nodes = @item.ref_sources.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = InfoNode.find_or_create_by_name(str_name)
        @item.ref_sources << new_obj unless existing_info_nodes.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @item.id
  end


  # -------------------------------------------------

  def add_to_tags
    @ft_subject = "Item"
    @ft_activity = "Select Tag".pluralize

    @item = Item.find(params[:id])
    @tags = Tag.choices_for(@item,'tags')
    @tags = @tags - [ @item ]
    @my_tags = @item.tags
    @tags.delete_if{|a| @my_tags.include?(a)}
  end
  
  def update_tags
    @item = Item.find(params[:id])
    @tags = [ Tag.find(params[:tag_ids]) ] if params[:tag_ids]
    @item.tags << @tags if @tags
    redirect_to :controller => @item.ctrlr_name, :action => 'edit', :id => @item, :anchor => 'tags'
  end

  def remove_from_tags
    @item = Item.find(params[:id])
    @tags = Tag.find(params[:tag_id])
    @item.tags.delete @tags
    redirect_to :controller => @item.ctrlr_name, :action => 'edit', :id => @item, :anchor => 'tags'
  end

  def quick_add_tags
    @item = Item.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_tags = @item.tags.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Tag.find_or_create_by_name(str_name)
        @item.tags << new_obj unless existing_tags.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @item.id
  end


  def csv_upload
    # no need to prepare any data - just show the view to post against 'upload_csv'
  end

  def upload_csv

    # commented out - instead try to load the csv without an intermediate file
    #fn = "#{RAILS_ROOT}/uploads/item_data.csv"
    #File.open(fn, "wb") { |f| f.write(params[:csv_file].read) }
    #Item.load_csv_file(fn) if Item.respond_to? :load_csv_file

    Item.load_csv_str(params[:csv_file].read) if Item.respond_to? :load_csv_str
    
    redirect_to :action => 'list' 
  end

  def download_csv
    if params[:field_list].nil? || @user_is_admin
      attr_names = Item.value_attrs
        
      adjacent_objs = [:owner]
      attr_names << adjacent_objs.collect{|c| c.to_s}
      attr_names = attr_names.flatten

    else
      attr_names = params[:field_list].to_s.split('|')
    end

    csv_string = String.new
    csv_string = attr_names.join(",") + "\n"

    # override visual pagination establishing the limit to 100,000 rows
    params[:page] = '1'
    params[:page_length] = '100000'

    prepare_list()

    all_objs = @items      
    
    if all_objs.size > 0 then
      all_objs.each do |record| 
        csv_string << '"'+attr_names.collect{|s| record.get_attr_val(s,'csv').to_s.gsub("\"","\"\"")}.join('","')+'"' + "\n"
      end
    end
    send_data csv_string, :filename => 'item_data.csv', :type => 'text/csv'
  end 

  # --- 

  def show_queries
    @ft_subject = "Item"
    @ft_activity  = "Reports"

    @queries = Item.query_specs

    render :partial => 'fast_ops/queries', :layout => 'application'
  end

  def run_query
    @def_page_size ||= 20
    @page_size = params[:page_length].to_i > 0 ? params[:page_length].to_i : @def_page_size

    @page_no = [ params[:page].to_i, 1 ].max
    @page_clause = "LIMIT #{@page_size.to_s} OFFSET #{((@page_no-1)*@page_size).to_s}"

    @query = Item.query_specs[params[:query]]
    @sort_fields = params[:order_by] || (! @query[:order_by].to_s.empty? && @query[:order_by].join(",")) || @query[:cols][0]
    @where_clause = params[:where] || (@query[:where].to_s.length > 0 ? @query[:where] : nil)

    @base_sql = @query[:sql] + (@where_clause ? " WHERE #{@where_clause}" : "") 
    @count = Item.count_by_sql("SELECT COUNT(id) FROM (#{@base_sql}) AS row_data")
    
    @sql = @base_sql + (@sort_fields ? " ORDER BY #{@sort_fields}" : "") + (@page_clause ? " #{@page_clause}" : "") 
    @rows = Item.find_by_sql(@sql)

    @cols = @query[:cols] || (@rows.size > 0 && @rows[0].attributes.keys)

    @link_params = { :controller => 'items', :action => 'show' }

    return @rows
  end

  def render_query_results
    @order_field = params[:order_by]
    params[:order_by] = quoted_name(@order_field) if params[:order_by]
    params[:order_by] += " #{params[:direction]}" if params[:direction]

    run_query()

    params[:order_by] = @order_field
    render :partial => 'fast_ops/query_results'
  end

  def before_prepare_list
    # override to set custom params and vars
  end

  def prepare_list
    orig_params = params.clone

    before_prepare_list()

    @ft_subject  = ( @ft_subject || "Item".pluralize )
    @ft_activity = ( @ft_activity || "All" )

    @order_field = ( params[:order_by] || "name" )
    @direction = ( params[:direction] || "ASC" )

    @query_param = ( params[:query] || "list_all" )
    params[:query] = @query_param
    
    params[:order_by] = quoted_name(@order_field) + " " + @direction

    @where_param = params[:where]  # save the original where param

    adjust_sorting_and_filtering_params(Item,params)
    @order_field = params[:sort_field].to_s unless params[:sort_field].to_s.empty?

    @items = run_query()

    # restore original params passed to the server
    params.clear
    params.merge!(orig_params)
  end

  # --- 

#BEGIN-UID.usermethods

#END-UID.usermethods

end

