filename= "scripts/mobs_list.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     no  = line.split(",")[0]
     name = line.split(",")[1].strip
     
     mob = Mob.new
     mob.no = no
     mob.name = name
     
     mob.save
   end
end