filename= "scripts/fetch/item_set_parts.csv"



File.open(filename, "r") do |file|  
   while line=file.gets
     set_no  = line.split(",")[0]
     item_no = line.split(",")[1]
     item = Item.where("no = ?",item_no)[0]
     set = ItemSet.where("no =?",set_no)[0]
     if item.nil? || set.nil?
       puts "#{item_no}-#{set_no} error"
       next  
     end
     
     item.item_set_id = set.id
     item.save
   end
end
