filename = "scripts/fetch/drop_items_wakfu.csv"

File.open(filename, "r") do |file|  
   while line=file.gets  
      type = line.split(',')[0]
      if type == "drop_into"
        if line.split(',')[6].include?"Trapper"
          trap_level = line.split(',')[6].delete("Trapper - Lvl ").strip.to_i
          puts "#{line.strip},#{trap_level}"
        else
          next
        end
      end
   end  
end