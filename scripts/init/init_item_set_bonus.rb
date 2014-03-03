filename= "scripts//item_set_bonus.csv"



File.open(filename, "r") do |file|  
   while line=file.gets
     set_no  = line.split(",")[0]     
     piece = line.split(",")[1]
     description = line.split(",")[2]
     fire = line.split(",")[3]
     air = line.split(",")[4]
     water = line.split(",")[5]
     earth = line.split(",")[6]
     

     set = ItemSet.where("no =?",set_no)[0]
     
     if  set.nil?
       puts "#{set_no} error"
       next  
     end
     
     set_stat = ItemSetStat.new
     
     set_stat.item_set_id = set.id
     set_stat.piece = piece
     set_stat.description = description
     set_stat.fire = fire
     set_stat.air = air
     set_stat.water = water
     set_stat.earth = earth
     
     set_stat.content = description.split(' ')[1]

     if description.split(' ')[0].include?("%")
       set_stat.percent = true
     end

     set_stat.value = description.split(' ')[0].delete('%').to_i
     
     set_stat.save
   end
end
