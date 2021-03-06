module PublicPagesHelper

#BEGIN-UID.usermethods

    # --- Returns HTML: div( div(label) div(list of p(link to each node)) )

    # labeled_node_list(anchor,opts={})     Name, Node, or Node Array; opts{:label, :list_background, :label_background, :label_color}
    # labeled_value_list(anchor,opts={})    Name or Node; opts{:label, :list_background, :label_background, :label_color}
    # labeled_string_array(arr,opts={})     String Array; opts{:label, :list_background, :label_background, :label_color}
    # table_of_subnodes(anchor, opts={})    Name or Node; opts{:label, :list_background, :label_background, :label_color}
    # what_links_here(node=@node,opts={})   Node; opts{:label, :list_background, :label_background, :label_color}

    # attr_rows_for(node)              For each attr: <tr><td>.name</td><td>.value</td></tr>

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

    # sub_nodes
    # refs
    # in_refs
    # parent
    # children
    # get_move_targets
    # get_subnode_by_name(node_name)        String
    # get_subnodes_of(anchor)               String, Node or Node Array


    def context_links obj
        rstr = ''
        c_obj = obj.container_obj
        if c_obj then
            rstr = rstr + '<p> Context: '

            hier = Array.new()
            while c_obj do
                hier << c_obj
                c_obj = c_obj.container_obj
            end
            sep_needed = false
            hier.reverse_each { | hobj |
                rstr = rstr + ' > ' if sep_needed
                rstr = rstr + link_to(hobj.iname, {:action => "show", :id => hobj}, { :title => hobj.display_name } )
                sep_needed = true
            }
            rstr = rstr + ' > ' + link_to(obj.iname, {:action => "show", :id => obj}, { :title => obj.display_name } )
            rstr = rstr + ' </p> '
         else
            rstr = rstr + '<p> Context: '
            rstr = rstr + link_to(obj.iname, {:action => "show", :id => obj}, { :title => obj.display_name } )
            rstr = rstr + ' </p> '
         end
         return rstr
    end

    # session stored mode indicator

    def get_mode()
      session['mode'] = session['mode'] || 'edit'
      return session['mode']
    end


    # component views

    def labeled_node_list(anchor,opts={})
      @opts = opts
      if anchor.instance_of? String then
        @list = @node.get_subnode_by_name(anchor)
        return "" if ! @list
        return render(:partial => 'labeled_node_list')

      elsif anchor.instance_of? InfoNode then
        @list = anchor
        return render(:partial => 'labeled_node_list')

      elsif anchor.instance_of? Array then
        @list = anchor
        return render(:partial => 'labeled_collection')

      else
        return anchor.to_s
      end
    end

    # ---

    def labeled_value_list(anchor,opts={})
      @list = anchor.instance_of?(String) ? @node.get_subnode_by_name(anchor) : anchor
      @opts = opts
      return render(:partial => 'labeled_value_list')
    end

    # ---

    def labeled_string_array(arr,opts={})
      @list = arr
      @opts = opts
      return render(:partial => 'labeled_string_array')
    end

    # ---

    def what_links_here(node=@node,opts={})
      links = referrers_to([node]).collect{ |item|
        link_to(item.parent.name,:action => 'show',:id => item.parent) +
        "/" +
        link_to(item.name,:action => 'show',:id => item)
      }
      return labeled_string_array(links,opts)
    end

    # ---

    def attr_rows_for(node)
      rows = ""
      for attr in node.node_attributes do
        rows << "<tr><td>#{attr.name}&nbsp;</td><td>&nbsp;#{auto_link attr.value.to_s}</td></tr> \r\n"
      end
      return rows
    end

    def attr_form_rows_for(node)
      rows = ""
      for attr in node.node_attributes do
        rows << <<-EOSTR
        <tr><td style="color:#585; padding:0px 4px 0px 4px;"><b>#{attr.name}&nbsp;</b></td><td>&nbsp;#{text_field_tag(attr.name,attr.value.to_s)}</td></tr>
        EOSTR
      end
      return rows
    end

    def update_attrs_form_for(node)
      return "" if node.node_attributes.size == 0
      return <<-EOS
        #{form_tag(:action => 'update_attrs', :id => node)}
          <table border="0">
          <tr> <td><b>Name</b></td> <td><b>Value</b></td> </tr>
            #{attr_form_rows_for(node)}
          </table>
          #{submit_tag("Save")}
        </form>
      EOS
    end

  # ---

  TableOfAttrs = Struct.new(:col_names, :rows)

  # The first arg can be a Node, Node Array or Name of a subnode of the current node (@node)

  def table_of_subnodes(anchor, opts={})
    return "" if anchor.nil?

    @table = TableOfAttrs.new([],[])

    nodes = nil
    if anchor.instance_of?(String)
      # if a name, get the subnode's children by that name
      nodes = @node.get_subnode_by_name(anchor)
      nodes = nodes ? nodes.children : []
    elsif anchor.instance_of?(InfoNode)
      # a single node passed in - collect its sub_nodes
      nodes = anchor.children
    elsif anchor.instance_of?(Array)
      nodes = anchor
    end

    return "" if nodes.nil?

    if opts[:select]
      attr_names = opts[:select]
      @table.col_names = opts[:select]
    else
      attr_names = nodes.collect{|sn| sn.node_attributes.collect{|nattr| nattr.name}}.flatten.uniq.sort
      @table.col_names = ["Name"] + attr_names
    end

    row_nodes = nodes
    if opts[:order_by] && opts[:order_by].downcase != 'name'
      row_nodes = row_nodes.sort{|r1,r2| r1.get_attr_value(opts[:order_by]) <=> r2.get_attr_value(opts[:order_by]) }
    else
      row_nodes = row_nodes.sort{|r1,r2| r1.name <=> r2.name }
    end

    rows = []
    for sn in row_nodes do
      attr_hash = {"Name" => link_to(sn.name, :action => 'show', :id => sn.id) }
      sn.node_attributes.each{|nattr| attr_hash[nattr.name] = nattr.value}
      rows << @table.col_names.collect{|aname| auto_link(attr_hash[aname].to_s)}
    end

    @table.rows = rows

    rtext = capture do
      render :partial => 'table_of_subnodes', :layout => false
    end

    rtext.gsub!(/\s+<tr>/,"\n<tr>")
    rtext.gsub!(/\s+<\/table>/,"\n</table>")

    # puts rtext
    return rtext
  end

  # ---

  def referrers_to(nodes)
    return InfoNode.get_referrers_to(nodes)
  end

  def parents_of(nodes)
    return InfoNode.get_parents_of(nodes)
  end

  def children_of(nodes)
    return InfoNode.get_children_of(nodes)
  end

  def get_nodes_in_domain
    return InfoNode.get_nodes_in_domain(session['domain'])
  end

  def nodes_by_name(node_name)
    return InfoNode.get_nodes_by_name(session['domain'],node_name)
  end


  # takes a string as a tag, a string with multiple words as tags, or an array of strings

  def elements_with_all_tags(tags)
    return InfoNode.elements_with_all_tags(session['domain'],tags)
  end

  def topic_list_for(items)
    rstr = ""
    for item in items do
      rstr << "* [[#{item.iname}]] \n"
    end
    return rstr
  end

  def tagged_topic_refs(tags)
    items = elements_with_all_tags(tags)
    return topic_list_for(items)
  end

  def wiki_expand_sq_brackets(text,anchor)
    while m = /\[\[([^\]\n]+)\]\]/.match(text) do

      str_ref = m[1].strip
      replacement_text = nil

      if str_ref == ">" then
        replacement_text = topic_list_for(anchor.sub_nodes)

      elsif str_ref[0,1] == "@" then
        replacement_text = tagged_topic_refs(str_ref.gsub("@",""))

      else
        page_name = str_ref.gsub(">","")

        if str_ref[0,1] == ">" then
          if str_ref[0,2] == ">>" then
            page = InfoNode.get_node_by_name(anchor,page_name)
            scope = 'subtree'
          else
            page = anchor.sub_nodes.find{|node| node.name == page_name}
            scope = 'subnodes'
          end

        elsif str_ref =~ /^[0-9]+$/ then
          if InfoNode.node_is_member?(session['domain'],str_ref) then
            page = InfoNode.find(str_ref)
            page_name = page.name
            scope = 'domain'
          else
            replacement_text = "&#91;&#91;#{str_ref}]] not found"
          end

        else
          page = InfoNode.get_node_by_name(session['domain'],page_name)
          scope = 'domain'
        end

        if replacement_text.nil? then
          if page then
            replacement_text = link_to(page_name,
                                :action => 'wiki_view_element', :id => page.id)
          else
            replacement_text = link_to("<span style='color:red;'>#{page_name}</span>",
                                :action => 'wiki_edit_element', :ref_id => anchor.id, :scope => scope, :name => str_ref)
          end
        end
      end

      text = m.pre_match.to_s + replacement_text.to_s + m.post_match.to_s
    end

    return text
  end

  def wiki_expand_vbar_brackets(text,anchor)
    while m = /\|\|([^|\n]+)\|\|(\s*\{[^}\n]+\})?/.match(text) do
      opts = eval( m[2] || "{}" )

      str_ref = m[1].strip

      if str_ref == "." then
        replacement_text = table_of_subnodes([anchor],opts)

      elsif str_ref == ">" then
        replacement_text = table_of_subnodes(anchor.sub_nodes,opts)

      elsif str_ref[0,1] == "@" then
        tags = str_ref.gsub("@","")
        items = elements_with_all_tags(tags)
        replacement_text = table_of_subnodes(items,opts)

      else
        break
      end

      text = m.pre_match.to_s + replacement_text.to_s + m.post_match.to_s
    end

    return text
  end

  def wiki_expand_inclusions(text,anchor)
    while m = /\{\{([^}\n]+)\}\}/.match(text) do
      str_ref = m[1].strip

      if str_ref =~ /^[0-9]+$/ && InfoNode.exists?(str_ref) then
          if InfoNode.node_is_member?(session['domain'],str_ref)
            page = InfoNode.find(str_ref)
          else
            page = nil
          end
      else
        page_name = str_ref.gsub(">","")

        if str_ref[0,1] == ">" then
          if str_ref[0,2] == ">>" then
            page = InfoNode.get_node_by_name(anchor,page_name)
          else
            page = anchor.sub_nodes.find{|node| node.name == page_name}
          end
        else
          page = InfoNode.get_node_by_name(session['domain'],page_name)
        end
      end

      if page && page != anchor then
        replacement_text = link_to("<h1>#{page.name.to_s}</h1>", :action => 'wiki_view_element', :id => page.id) +
                            "\n\n" +
                            wikize(page.node_sections[0].body.to_s,page)
      else
        replacement_text = "#{page_name} not found"
      end

      text = m.pre_match.to_s + replacement_text.to_s + m.post_match.to_s
    end

    return text
  end

  def wiki_link(text,anchor=@node)
    text = wiki_expand_sq_brackets(text,anchor)
    text = wiki_expand_vbar_brackets(text,anchor)
    text = wiki_expand_inclusions(text,anchor)

    return text
  end

  def normalize_table_tags(text)
    text = text.gsub("<table>","<table cellspacing='1' bgcolor='black'>")
    return text
  end

  def wikize(text,anchor=@node)
    @recursion_level = @recursion_level.nil? ? 0 : @recursion_level + 1
    return "Recursion Halt - More than 16 inclusion levels reached" if @recursion_level > 16

    text = normalize_table_tags(rc_format(wiki_link(anchor.node_sections[0].body.to_s,anchor)))
    @recursion_level = @recursion_level - 1

    return text
  end


#END-UID.usermethods

end
