filename= "scripts/fetch/wakfu_trapper_item.csv"

File.open(filename, "r") do |file|  
   while line=file.gets     
     mob_no  = line.split(",")[1]
     mob = Mob.where("no = ?",mob_no)[0]
     item_no  = line.split(",")[2]
     item = Item.where("no = ?",item_no)[0]
     
     if mob && item
       drop_item =  TrapperItem.where("item_id = ? and mob_id = ?",item.id,mob.id)[0]
       if drop_item.nil?
         drop_item = TrapperItem.new
         drop_item.mob_id = mob.id
         drop_item.item_id = item.id
         drop_item.skill = "Trapping"
         drop_item.level = line.split(",")[7].to_i
         drop_item.save
       else
         drop_item.level = line.split(",")[7].to_i
         drop_item.save
       end
     else
       puts "error,#{item_no},#{mob_no}"
     end
     


   end
end