filename = "scripts/item_types_all.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     no  = line.split(",")[0]
     chinese_name = line.split(",")[1]
     english_name = line.split(",")[2]
     cate_name = line.split(",")[3]
     
     item_type = ItemType.new
     item_type.no = no
     item_type.chinese_name = chinese_name
     item_type.english_name = english_name
     item_type.cate_name = cate_name.strip!
     item_type.save
     
     
     items = Item.where(:item_type_id => item_type.no)
     items.each do |item|
       item.item_type_id = item_type.id
       item.save
     end
   end
end

