config_file= "scripts/fetch/wakfu_equips_list.csv"
File.open(config_file, "r") do |file|  
   while line=file.gets  
      no = line.split[0]
      @item = Item.where("no = ?",no)[0]
      
      if @item.nil?
        puts "#{no} is null"
      else
        if @item.hidden
          puts "#{@item.id} is hidden"
          @item.hidden = false 
          @item.save
        end
      end
      
   end
end