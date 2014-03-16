filename = "scripts/fetch/drop_items_wakfu.csv"

File.open(filename, "r") do |file|  
   while line=file.gets  
      type = line.split(',')[0]
      if type == "mob_info"
        puts line
      end
   end  
end