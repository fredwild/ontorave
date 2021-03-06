class FastOpsController < ApplicationController

  def index
    prepare_list()
    render :action => @ft_custom_action and return if @ft_custom_action
    render :action => 'list'
  end

  def images
    @upload_name = params[:upload]
    session['return-to'] = request.env["HTTP_REFERER"]

    @compact = params[:style] && params[:style] == "compact"

    @ft_subject = "Upload Image"
    @ft_activity  = @upload_name ? @upload_name.to_s : "Admin"

    dir_name = image_dirpath()
    FileUtils.mkdir_p(dir_name) if ! FileTest.exist?(dir_name)

    @files = Dir.entries(dir_name)
    @files = @files.select{|entry| entry != "." && entry != ".." }
  end

  def upload_image
    if params[:form_file] && params[:form_file].size > 0 && params[:filename] && params[:filename].size > 0 then
      unless params[:class_name] && params[:instance_id] && params[:attr_name]
        filename = params[:filename]
      else
        filename = params[:class_name].underscore + "_" + params[:attr_name] + "_" + params[:instance_id] +
                   params[:form_file].original_filename[/\.\w\w\w/].downcase
        obj = params[:class_name].constantize.find(params[:instance_id])
        obj.send("#{params[:attr_name]}=",filename)
        obj.save
      end

      dir_name = image_dirpath()
      FileUtils.mkdir_p(dir_name) if ! FileTest.exist?(dir_name)

      fn = "#{dir_name}/#{filename}"
      File.open(fn, "wb") { |f| f.write(params[:form_file].read) }
    end

    if session['return-to'].nil?
      redirect_to :back
    else 
      redirect_to session['return-to']
    end
  end

  def delete_image
    if params[:delete] && params[:delete].size > 0 then
      dir_name = image_dirpath()
      File.delete(dir_name+"/"+params[:delete]) if File.exist?(dir_name+"/"+params[:delete])
    end

    redirect_to :back
  end 

  # --------------------------------------------------------

  def docs
    @upload_name = params[:upload]
    session['return-to'] = request.env["HTTP_REFERER"]

    @ft_subject = "Attachments"
    @ft_activity = "Add, View or Delete"

    dir_name = doc_dirpath()
    FileUtils.mkdir_p(dir_name) if ! FileTest.exist?(dir_name)

    @files = Dir.entries(dir_name)
    @files = @files.select{|entry| entry != "." && entry != ".." }
  end 

  def upload_doc
    if params[:doc_file] && params[:doc_file].size > 0 then
      filename = params[:filename].empty? ? params[:doc_file].original_filename : params[:filename]

      dir_name = doc_dirpath()
      FileUtils.mkdir_p(dir_name) if ! FileTest.exist?(dir_name)

      fn = "#{dir_name}/#{filename}"
      File.open(fn, "wb") { |f| f.write(params[:doc_file].read) }
    end

    if session['return-to'].nil?
      redirect_to :back
    else 
      redirect_to session['return-to']
    end
  end

  def delete_doc
    if params[:delete] && params[:delete].size > 0 then
      dir_name = doc_dirpath()
      File.delete(dir_name+"/"+params[:delete]) if File.exist?(dir_name+"/"+params[:delete])
    end

    redirect_to :back
  end 

  def edit_style_sheet
    if params[:css_name] && params[:css_text] && ! params[:css_text].empty?
       filename = "#{RAILS_ROOT}/public/stylesheets/#{params[:css_name]}"
       File.open(filename,"wb"){|f| f.write(params[:css_text].to_s)}
    end
    redirect_to :back
  end

  def toggle_list_text_toggle
    session['list_text_toggles'] = ! session['list_text_toggles'] 
    redirect_to :back
  end

  def toggle_list_image_toggle
    session['list_image_toggles'] = ! session['list_image_toggles'] 
    redirect_to :back
  end

#BEGIN-UID.usermethods

#END-UID.usermethods

end

