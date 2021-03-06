class FullTextSearchController < ApplicationController

  layout :none

  def search
    @search_text = params[:search_text]
    redirect_to :back if ! @search_text || @search_text.size == 0

    @pattern_to_find = /#{@search_text}/i
    @results = Array.new()

    rows = Section.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.body && instance.body.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'body' }
        end
        
    }
    rows = Attribute.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.value && instance.value.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'value' }
        end
        
    }
    rows = Value.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        
    }
    rows = InfoNode.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.view && instance.view.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'view' }
        end
        
    }
    rows = Tag.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.count && instance.count.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'count' }
        end
        
    }
    rows = Property.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.value && instance.value.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'value' }
        end
        
    }

  end


#BEGIN-UID.usermethods

#END-UID.usermethods


end
