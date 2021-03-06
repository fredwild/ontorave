# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'pp'
require 'ft_controller_macros'
require 'ft_modules'

class ApplicationController < ActionController::Base

   # Pick a unique cookie name to distinguish our session data from others'
   # session :session_key => '_ontorave'

   include FtUtils
   include ApplicationHelper

   # caches_action :show, :show_as_doc, :list, :block_list
   # before_filter :invalidate_caches, :except => [ :show, :show_as_doc, :list, :block_list, :new, :index ]

   def invalidate_caches
      expire_action :controller => 'index', :action => 'index'
      expire_action :controller => controller_name, :action => 'list'
      expire_action :controller => controller_name, :action => 'block_list'
      expire_action :controller => controller_name, :action => 'show', :id => params[:id] if params[:id] 

      expire_fragment %r{.*list.*} if params[:action] == "toggle_list_text_toggle"

      if params.keys.select{|kv| kv.include?("_id")}.size > 0 || params[:action] == 'update' || params[:action] == 'destroy' || params[:action].include?("delete") then
        expire_fragment %r{.*show.*} 
        expire_fragment %r{.*list.*} 
      end

      return true
   end

   before_filter :fix_req
   def fix_req
     params[:format] = "html" if ! params[:format]
     return true
   end

  public 

  # prevents method def exceptions - does nothing and returns nil
  def method_missing(methName) end

  def get_order_field params, obj_name, coll_name, default_order
     if params[:order_sublist] && params[:order_by] then
      session["order_sublist_"+obj_name+"_"+params[:order_sublist]] = params[:order_by]
     end
      
     return session["order_sublist_"+obj_name+"_"+coll_name] if session["order_sublist_"+obj_name+"_"+coll_name] && session["order_sublist_"+obj_name+"_"+coll_name].length > 0
     return default_order
  end

  before_filter :customs, :only => [ :index, :new, :edit, :show, :show_as_doc, :list, :block_list, 
                                     :login, :register, :edit_reg_info, :change_password, :user_main_view ]
  def customs
    @ft_custom_action = nil
    return true if session['user'] && session['user'].login == 'admin'

    if File.exist?("#{RAILS_ROOT}/app/views/#{controller_name}/#{params[:action]}_custom.html.erb")
      @ft_custom_action = "#{params[:action]}_custom"
    end

    return true
  end

#BEGIN-UID.usermethods


  before_filter :gated_entry, :except => [ :gated_entry, :entry_gate ]

  def gated_entry
    return true if session['access_ok']
    redirect_to :controller => 'index', :action => 'entry_gate' and return false
  end

  before_filter :domain_access, :only => [  :show, :show_element, :edit_element, :display_element,
                                            :wiki_view_element, :wiki_edit_elment ]

  def domain_access
    return true if session['domain'].nil? || params[:id].nil? || session['admin']

    if InfoNode.node_is_member?(session['domain'],params[:id])
      return true
    else
      redirect_to :controller => 'public_pages', :action => 'show', :id => session['domain'].id
      return false
    end
  end



  # maintains the current user mode

  def get_mode()
    session['mode'] = session['mode'] || 'edit'
    return session['mode']
  end

  def set_mode(mode)
    session['mode'] = mode
  end

#END-UID.usermethods

end
