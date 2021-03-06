class PublicPagesController < ApplicationController

#BEGIN-UID.usermethods

  def index
    redirect_to :action => 'top'
  end

  ###

  before_filter :require_domain, :except => [ :top ]

  def require_domain
    redirect_to :action => 'top' and return false if ! session['domain']
    return true
  end
    
  #
  #

  def top
    @node = InfoNode.find(params[:id]) if params[:id]
    
    unless @node
      dname = params[:domain] || (session['domain'] && session['domain'].name) || 'Top'
      @node = InfoNode.top_level_items.find{|x| x.name == dname}
      @node = InfoNode.create(:name => dname) if ! @node
    end

    @node.set_tag('_is_wiki') if params[:mode].to_s == 'wiki'
    
    session['domain'] = @node

    set_mode('edit')
    if @node.has_tag?("_is_wiki") then
      set_mode('wiki_view')
    end 
    
    redirect_to :action => "#{get_mode}_element", :id => @node
  end

  #
  #
  
  def show
    redirect_to params.merge(:action => 'show_element')
  end

  def show_element
    set_mode('show')    
    display_element()
  end

  #

  def edit
    redirect_to params.merge(:action => 'edit_element')
  end

  def edit_element
    set_mode('edit')
    display_element()
  end

  #
  
  def display_element
    redirect_to :action => 'top' and return if ! params[:id]
    redirect_to :action => 'top' and return if ! InfoNode.exists?(params[:id])
    
    @node = InfoNode.find(params[:id])
    apply_context()

    if get_mode == 'show' && @node.has_a_view? then
      render :inline => @node.get_view_text, :layout => 'inline'
    else
      render :action => "#{get_mode}_element"
    end
  end

  #

  def apply_context
    @node.apply_container_tags(@node.parent)
    @node.apply_templates
    
    @tags = @node.user_tags
    @values = @node.node_values
    @attributes = @node.node_attributes
    @docs  = @node.node_sections
    @sub_nodes = @node.sub_nodes
    @refs = @node.refs
    @in_refs = @node.in_refs
    
    @mode = get_mode()
  end

  #

  def move_up
    @node = InfoNode.find(params[:id])

    @d1 = Section.find(params[:prev_id])
    @d2 = Section.find(params[:curr_id])

    @d1.sort_code, @d2.sort_code = @d2.sort_code, @d1.sort_code
    @d1.save; @d2.save
    
    redirect_to :action => 'display_element', :id => @node
  end

  #
  
  def rename_node 
    @node = InfoNode.find(params[:id])
    if params[:new_name] && ! params[:new_name].empty?
      name = params[:new_name].to_s[0,InfoNode.attr_lengths['name']]  
      @node.rename_to(name.strip)
      @node.save
    end
    render :text => "#{@node.name.to_s}"
  end
  
  def move_to_form
    @node = InfoNode.find(params[:id])
    render :partial => 'move_to_form'
  end
  
  def move_to_node
    @node = InfoNode.find(params[:id])
    if params[:target] && params[:target] != "0"
      @target = InfoNode.find(params[:target])
      @node.move_to(@target)
      @node.apply_container_tags(@target)
      redirect_to :action => "#{get_mode}_element", :id => @target
    else
      redirect_to :action => "#{get_mode}_element", :id => @node
    end
  end
  
  def delete
    @node = InfoNode.find(params[:id])
    redirect_to :action => 'top' and return if @node.is_domain?
    
    @owner = @node.container_obj
    @node.destroy
    redirect_to :action => "#{get_mode}_element", :id => @owner
  end
 
  #

  def kill_items(items, among_items)
    for item in items do
      obj = among_items.find{|x| x.name == item.strip}
      obj.destroy if obj
    end    
  end


  def add_tags
    @node = InfoNode.find(params[:id])
    adding = params[:commit].to_s == "Save"

    nodes_to_tag = [@node]
    nodes_to_tag = @node.sub_nodes if params[:scope].to_s.downcase.include?("subtopic")
    
    items = params[:items].split(/\s*\n\s*/).select{|item| item && ! item.empty? }
    for item in items do
      name = item.strip.to_s[0,Tag.attr_lengths['name']].gsub(/\s+/,"_")
      for node in nodes_to_tag do
        node.set_tag    name if adding
        node.remove_tag name if ! adding
      end

      if params[:scope].to_s.downcase.include?("on-going")
        @node.set_tag    "_apply_tag_#{name}" if adding
        @node.remove_tag "_apply_tag_#{name}" if ! adding
      end 
    end

    
    redirect_to :action => "#{get_mode}_element", :id => @node
  end


  def auto_complete_for_tag_name
    @items = [] 
    tag = params[:tag] && params[:tag][:name]
    if tag =~ /[a-z0-9][a-z0-9_]*/ then
      @items = Tag.find(:all, :conditions => [ 'name LIKE ?', '%' + params[:tag][:name] + '%' ])
      @items.delete_if{|t| t.name[0,1] == "_" || ["is_","as_"].include?(t.name[0,3])}

      @dtags = Tag.get_tags_for_domain(session['domain'])
      
      @items = @items & @dtags
    end 
    render :inline => "<%= auto_complete_result(@items, 'name') %>"
  end

  def find_by_tags
    tags = params[:tag] && params[:tag][:name]
    items = InfoNode.elements_with_all_tags(session['domain'], tags)

    rstr = "<ul>"
    for item in items.sort{|i1,i2| i1.iname <=> i2.iname} do
      rstr << <<-LINEITEM 
      <li style="background:white; margin:0px 0px 0px 10px;">
      <a href="#{ url_for :action => 'wiki_view_element', :id => item }"> #{item.iname} </a>
      </li>
      LINEITEM
    end
    rstr << "</ul>"
    render :text => rstr
  end

  def add_values
    @node = InfoNode.find(params[:id])
    items = params[:items].split(/\s*\n\s*/).select{|item| item && ! item.empty? }
    if params[:commit].to_s == "Save" then
      for item in items do
        name = item.strip.to_s[0,Value.attr_lengths['name']].gsub(/\s+/," ")
        unless @node.node_values.find{|li| li.name == name}
          newone = Value.new
          newone.owner = @node
          newone.name = name
          newone.save
        end
      end
    else
      kill_items items, @node.node_values
    end
    redirect_to :action => "#{get_mode}_element", :id => @node
  end


  def add_attributes
    @node = InfoNode.find(params[:id])
    items = params[:items].split(/\s*\n\s*/).select{|item| item && ! item.empty? }
    if params[:commit].to_s == "Save" then
      for item in items do
        parts = item.split(/\s*:\s*/).select{|item| item && ! item.empty? }
        name = parts[0].strip.to_s[0,Attribute.attr_lengths['name']].gsub(/\s+/," ")
        value = parts[1..-1].join(":").strip.to_s[0,Attribute.attr_lengths['value']].gsub(/\s+/," ")
        
        existing = @node.node_attributes.find{|li| li.name == name}
        
        obj = existing || Attribute.new
        obj.owner = @node
        
        obj.name = name
        obj.value = value
        obj.save
      end
    elsif params[:commit].to_s == "Rename" then
      for item in items do
        parts = item.split(/\s*:\s*/).select{|item| item && ! item.empty? }
        name = parts[0].strip.to_s[0,Attribute.attr_lengths['name']].gsub(/\s+/," ")
        value = parts[1..-1].join(":").strip.to_s[0,Attribute.attr_lengths['name']].gsub(/\s+/," ")
        
        existing = @node.node_attributes.find{|li| li.name == name}
        next if ! existing
        
        existing.name = value
        existing.save
      end
    else
      items = items.collect{|item| item.split(/\s*:\s*/).select{|item| item && ! item.empty? }[0]}
      kill_items items, @node.node_attributes
    end 
    redirect_to :action => "#{get_mode}_element", :id => @node
  end
  
  
  def update_attrs
    @node = InfoNode.find(params[:id])
    keys = params.keys
    for attr in @node.node_attributes do
      if keys.include?(attr.name)
        attr.value = params[attr.name][0,Attribute.attr_lengths['value']].strip.gsub(/\s+/," ")
        attr.save
      end
    end
    redirect_to :action => "#{get_mode}_element", :id => @node
  end

  def node_exists_for?(name)
    return @node.sub_nodes.find{|li| li.name == name} 
  end

  def add_sub_nodes
    @node = InfoNode.find(params[:id])
    items = params[:items].split(/\s*\n\s*/).select{|item| item && ! item.empty? }
    if params[:commit].to_s == "Save" then
      for item in items do
        name = item.strip.to_s[0,InfoNode.attr_lengths['name']].gsub(/\s+/," ")
        unless node_exists_for?(name)
          newone = InfoNode.new
          newone.owner = @node
          
          newone.name = name
          newone.save
          
          newone.apply_container_tags(@node)
          newone.set_tag domain_tag()
        end
      end
    else 
      kill_items items, @node.sub_nodes
    end
    redirect_to :action => "#{get_mode}_element", :id => @node
  end
 
  def domain_tag
    return InfoNode.domain_tag(session['domain'])
  end
  
  def add_refs
    @node = InfoNode.find(params[:id])
    items = params[:items].split(/\s*\n\s*/).select{|item| item && ! item.empty? }
    do_add = params[:commit].to_s == "Save"
    for item in items do
      name = item.strip.to_s[0,InfoNode.attr_lengths['name']]
      name.gsub!(/\s+/," ")
      if do_add then
        targs = InfoNode.get_nodes_in_domain(session['domain']).select{|x| x.name_matches(name)}
        @node.ref_targets << targs.delete_if{|t| @node.ref_targets.include?(t)}
      else
        remove_these = @node.ref_targets.find(:all, :conditions => ["name = ?",name])
        @node.ref_targets.delete remove_these
      end
    end
    redirect_to :action => "#{get_mode}_element", :id => @node
  end
 
  
  def add_doc
    @node = InfoNode.find(params[:id])
    redirect_to :action => "#{get_mode}_element", :id => @node and return if params[:name].empty?

    name = params[:name].to_s[0,Section.attr_lengths['name']].strip.gsub(/\s+/," ")
    
    if params[:commit].to_s == "Save" then
      existing = @node.node_sections.find{|li| li.name == name}
      doc = existing || Section.new
      doc.owner = @node
      doc.name = name
      doc.body = params[:body]
      doc.save
    else 
      obj = @node.node_sections.find{|li| li.name == name}
      obj.destroy if obj
    end
    redirect_to :action => "#{get_mode}_element", :id => @node
  end


  def apply_sub_item_edits
    @node = InfoNode.find(params[:id])

    text = params[:text].strip
    
    if params[:commit].to_s == "Add Tag"
      if params[:ids] && params[:ids].size > 0 
        sub_items = InfoNode.find(params[:ids].keys)
        for si in sub_items do
          si.set_tag(text)
        end
      end
    end

    if params[:commit].to_s == "Delete"
      if params[:ids] && params[:ids].size > 0 
        sub_items = InfoNode.find(params[:ids].keys)
        for si in sub_items do
          si.destroy
        end
      end
    end

    # render :action => 'debug'
    redirect_to :action => "#{get_mode}_element", :id => @node
  end

  def remove_tag
    @node = InfoNode.find(params[:id])
    @context = params[:context] && InfoNode.find(params[:context])
    @context = @node.container_obj if ! @context
    @tag = @node.tags.find(params[:tagid])
    @node.tags.delete @tag
    redirect_to :action => "#{get_mode}_element", :id => @context || session['domain']
    # render :action => 'debug'
  end

  # ---

  def edit_doc_item
    @doc_item = Section.find(params[:id])
    render :partial => 'edit_doc_item'
  end

  def update_doc_item
    @doc_item = Section.find(params[:id])
    params[:doc_item][:name] = params[:doc_item][:name][0,Section.attr_lengths['name']].strip.gsub(/\s+/," ")
    @doc_item.update_attributes(params[:doc_item])
    redirect_to :action => 'edit_element', :id => @doc_item.owner
  end

  # ---

  def edit_view
    @node = InfoNode.find(params[:id])
    render :partial => 'edit_view'
  end

  def update_view
    @node = InfoNode.find(params[:id])
    @node.view = params[:node][:view]
    @node.save
  
    action = @node.has_tag?("_is_view") ? "show_element" : "edit_element"
    redirect_to :action => action, :id => @node
  end


  def help_edit_view
    render :text => <<-INFO 
<pre style="font-family:courier new;">
CUSTOM VIEW REFERENCE:
    
    # --- Returns HTML: div( div(label) div(list of p(link to each node)) )
  
    # labeled_node_list(anchor,opts={})     Name, Node, or Node Array; opts{:label, :list_background, :label_background, :label_color}
    # labeled_value_list(anchor,opts={})    Name or Node; opts{:label, :list_background, :label_background, :label_color}
    # labeled_string_array(arr,opts={})     String Array; opts{:label, :list_background, :label_background, :label_color}
    # table_of_subnodes(anchor, opts={})    Name or Node; opts{:label, :list_background, :label_background, :label_color}
    # what_links_here(node=@node,opts={})   Node; opts{:label, :list_background, :label_background, :label_color}

    # attr_form_rows_for(node)              For each attr: <tr><td>.name</td><td>.value</td></tr>
  
  
    # --- Returns Collections
  
    # referrers_to(node_array)              Node or Node Array
    # parents_of(node_array)                Node or Node Array
    # children_of(node_array)               Node or Node Array
  
    # get_nodes_in_domain
    # nodes_by_name(node_name)              String
    # elements_with_all_tags(tags)          String or String Array
  
  
    # --- @instance_variables
    
    #  @tags            Returns objs with: .name, .items
    #  @values          Returns objs with: .name
    #  @attributes      Returns objs with: .name, .value
    #  @docs            Returns objs with: .name, .body
    #  @sub_nodes       Returns objs with: .name, .tags, .node_attributes, .node_values, .refs, .in_refs, .parent, .children
    #  @refs            Returns objs with: .name, .tags, .node_attributes, .node_values, .refs, .in_refs, .parent, .children
    #  @in_refs         Returns objs with: .name, .tags, .node_attributes, .node_values, .refs, .in_refs, .parent, .children
  
  
    # --- Methods of @node
  
    # .sub_nodes
    # .refs
    # .in_refs
    # .parent
    # .children
    # .get_move_targets
    # .get_subnode_by_name(node_name)        String
    # .get_subnodes_of(anchor)               String, Node or Node Array
    # .has_all_tags?(tags)                   String, String Array
</pre>
    INFO
  end


  #
  #
  #

  before_filter :apply_wiki_mode, :only => [:show_element, :edit_element]
  
  def apply_wiki_mode
    @node = InfoNode.find(params[:id])
    
    if get_mode.to_s[0,4] == 'wiki' then
      case params[:action]
        when 'show_element'
          redirect_to params.merge(:action => 'wiki_view_element') and return false
        when 'edit_element'
          redirect_to params.merge(:action => 'wiki_edit_element') and return false
      end
    else
      return true
    end        
  end

  #

  def wiki_view_element
    set_mode('wiki_view')

    @node = InfoNode.find(params[:id])
    apply_wiki_rules()
    render :layout => 'wiki'
  end

  def wiki_edit_element
    set_mode('wiki_edit')
    
    if params[:name] then
      name = params[:name].to_s.strip.gsub(/\s+/," ")

      scope = params[:scope]
      
      case scope 
        when 'domain'
          @node = InfoNode.get_node_by_name(session['domain'],filtered_name(name)) 
      
        when 'subtree'
          @ref_node = InfoNode.find(params[:ref_id])
          @node = InfoNode.get_node_by_name(@ref_node,filtered_name(name)) 

        when 'subnodes'
          @ref_node = InfoNode.find(params[:ref_id])
          @node = @ref_node.sub_nodes.find{|node| node.name == name} 
      end

      @node = wiki_create_new_page(name,scope) unless @node
    else
      @node = InfoNode.find(params[:id])
    end

    apply_wiki_rules()
    render :layout => 'wiki'
  end

  def wiki_create_new_page(name,scope)
    @node = InfoNode.create(:name => filtered_name(name))
    
    if scope == 'domain'
      owner = session['domain']
    else
      owner = @ref_node
    end
    
    owner.items << @node
    @node.set_tag domain_tag()

    return @node
  end

  def filtered_name(name)
    name = name.gsub(">","")
    return name
  end

  def apply_wiki_rules
    apply_context()
    impose_doc_section()
  end
  
  def impose_doc_section()
    if @docs.size == 0 then
      @doc = Section.create(:name => 'wiki page', :body => "Empty...")
      @node.items << @doc
      @docs = @node.node_sections 
    end
  end

  def wiki_update
    @section = Section.find(params[:id])
    @section.update_attributes params[:doc]
    @node = @section.parent
    
    redirect_to :action => 'wiki_view_element', :id => @node
  end


#END-UID.usermethods

end

