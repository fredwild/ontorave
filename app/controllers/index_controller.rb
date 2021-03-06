class IndexController < ApplicationController

  def index
    @ft_subject = "Welcome to OntoRave"
    @ft_activity  = "Contents"
    render :action => @ft_custom_action if @ft_custom_action
  end

#BEGIN-UID.usermethods

  def entry_gate
    @ft_subject = "Access Controls"
    @ft_activity  = "Enter Passcode"

    session['access_ok'] = false
    session['admin'] = false
    session['domain'] = nil

    if params[:passwd] && params[:passwd] == 'Admin!!'
      session['access_ok'] = true
      session['admin'] = true
      redirect_to :controller => 'index', :action => 'index'
    elsif params[:passwd]
      if domain = get_domain_for_passcode(params[:passwd])
        session['access_ok'] = true
        session['admin'] = false
        redirect_to(:controller => 'public_pages', :action => 'top', :domain => domain.name.to_s)
      end
    end
  end

  def index
    @ft_subject = "Welcome to OntoRave"
    @ft_activity  = "Contents"

    if session['admin']
      action = 'index'
      action = 'index_custom'  if File.exist?("#{RAILS_ROOT}/app/views/index/index_custom.rhtml")
      render :action => action
    else
      session['access_ok'] = false
      session['admin'] = false
      session['domain'] = nil
      set_mode nil

      redirect_to :action => 'entry_gate'
    end
  end

  def get_domain_for_passcode(passcode)
    return nil if passcode.nil?

    domains = InfoNode.get_domains()
    for d in domains do
      prop = d.get_prop("passcode")
      return d if prop && prop.value == passcode
    end
    return nil
  end

#END-UID.usermethods


end
