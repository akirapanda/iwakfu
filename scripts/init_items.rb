filename = "item-list.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     no  = line.split(",")[0]
     name = line.split(",")[1]
     content = line.split(",")[2]
     
     item = Item.new
     item.no = no
     item.name = name
     item.content = content
     item.save
     
   end
end

