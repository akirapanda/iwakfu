filenames =["scripts/fetch/wakfu_equips_list.csv","scripts/fetch/wakfu_resource_list.csv","scripts/fetch/wakfu_consumables_list.csv","scripts/fetch/wakfu_miscellaneous_list.csv"]

filenames.each do |filename|
  File.open(filename, "r") do |file|  
     while line=file.gets
       no  = line.split(",")[0]
       item = Item.where("no = ?",no)[0]
       if item.nil?
         item = Item.new
         item.no = no
         item.name = line.split(",")[1]
         item.info = line.split(",")[2].to_s
         item.level = line.split(",")[3].to_i
         item.save
       else
         item.hidden = false
         item.info = line.split(",")[2].to_s
         item.level = line.split(",")[3].to_i
         item.save
       end

     end
  end
end