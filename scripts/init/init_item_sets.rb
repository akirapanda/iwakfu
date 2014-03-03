filename= "scripts/fetch/item_sets_list.csv"
chinese_file= "scripts/fetch/item_sets_chinese_name.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     no  = line.split(",")[0]
     english_name = line.split(",")[1]
     piece = line.split(",")[2].to_i
     level = line.split(",")[3].to_i
     
     item_set = ItemSet.new
     item_set.no = no
     item_set.english_name = english_name
     item_set.piece = piece
     item_set.level = level
     
     item_set.save
   end
end


File.open(chinese_file, "r") do |file|  
   while line=file.gets
     no  = line.split(",")[0]
     
     item_set = ItemSet.where("no = ?",no)[0]
     item_set.chinese_name = line.split(",")[2].strip!
     item_set.save
   end
end
