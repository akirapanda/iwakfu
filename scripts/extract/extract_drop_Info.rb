filename = "scripts/fetch/drop_items_wakfu.csv"

File.open(filename, "r") do |file|  
   while line=file.gets  
      type = line.split(',')[0]
      if type == "drop_into"
        if line.split(',')[6].include?"Trapper"
          next
        else
          puts line
        end
      end
   end  
end