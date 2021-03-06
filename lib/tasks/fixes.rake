
desc "Fixes order codes"
task :fhw_order_codes => :environment do

    count = 0 

    items = Item.find(:all)

    for item in items do
        item.sort_code = item.id.to_i
        item.save
        puts item.name + " "  +  item.sort_code.to_s
    end

end


desc "Purge unused tags"
task :fhw_purge_tags => :environment do

    items = Tag.find(:all)

    for item in items do
        item.destroy if item.count == 0 
    end

end



