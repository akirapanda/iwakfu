inputfile = "scripts/check/miss_item_list.csv"
config_file= "scripts/fetch/wakfu_equips_list.csv"

File.open(inputfile, "r") do |file|  
   while line=file.gets  
        no = line.strip
        File.open(config_file, "r") do |f|  
          while l=f.gets  
            if l.split(',')[0].strip == no
              puts l
            end
          end
        end
   end
end