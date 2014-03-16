filename= "scripts/fetch/wakfu_mobs_list.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     no  = line.split(",")[0]
     mob = Mob.where("no = ?",no)[0]
     if mob.nil?
       mob = Mob.new
       mob.no = no
       mob.name = line.split(",")[1].to_s
       mob.level = line.split(",")[3].to_i
       mob.save
     else
       mob.hidden = false
       mob.save
     end

   end
end