filenames =["scripts/fetch/wakfu_mob_info.csv"]

filenames.each do |filename|
  File.open(filename, "r") do |file|  
     while line=file.gets
       no  = line.split(",")[1]
       item = Mob.where("no = ?",no)[0]
       
       if item.nil?
         puts "errotr,#{no}"
       else
         item.hp = line.split(",")[2].to_i
         item.ap = line.split(",")[3].to_i
         item.mp = line.split(",")[4].to_i
         item.wp = line.split(",")[5].to_i
         item.init = line.split(",")[6].to_i
         item.lock = line.split(",")[7].to_i
         item.dodge = line.split(",")[8].to_i
         item.block = line.split(",")[9].to_i
         item.perception = line.split(",")[10].to_i
         item.crit = line.split(",")[11].to_i


         item. water_damage = line.split(",")[12].to_i
         item.water_resist = line.split(",")[13].to_i
         item.earth_damage = line.split(",")[14].to_i
         item.earth_resist = line.split(",")[15].to_i
         item.air_damage = line.split(",")[16].to_i
         item.air_resist = line.split(",")[17].to_i
         item.fire_damage = line.split(",")[18].to_i
         item.fire_resist = line.split(",")[19].to_i
         if line.split(",")[20].strip.to_s.include?("true")
           item.capture_flag = true
         else
           item.capture_flag = false
         end
         puts "#{item.capture_flag}"
         item.save
       end
      
     end
  end
end