filename = "scripts/items.properties"
another = "scripts/items_1.properties"

File.open(filename, "r") do |file|  
   while line=file.gets  
      if line.include?("content.15.")
        name = line.split('=')[0].split(".")[2]
        desc = line.split('=')[1].chomp

        
        File.open(another, "r") do |f|  
          while l=f.gets  
            if l.include?("content.16."+name+"=")
              content = l.split("=")[1]
              puts "#{name},#{desc},#{content}" 
              
            end
          end
        end
        
      end
   end  
end