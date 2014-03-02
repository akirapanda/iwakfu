filename = "scripts/item_types_all.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     no  = line.split(",")[0]
     chinese_name = line.split(",")[1]
     english_name = line.split(",")[2]
     
     item_type = ItemType.new
     item_type.no = no
     item_type.chinese_name = chinese_name
     item_type.english_name = english_name
     item_type.save
   end
end

