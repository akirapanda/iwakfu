filename= "scripts/trapper_items.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     mob_no  = line.split(",")[0].strip.to_s
     item_no = line.split(",")[1].strip.to_s
     
     @mob = Mob.where("no=?",mob_no)[0]
     @item = Item.where("no=?",item_no)[0]
     skill = line.split(",")[2].to_s
     level =line.split(",")[3].strip.to_i
     
     if @mob && @item
       @item_drop = TrapperItem.new
       @item_drop.mob_id = @mob.id
       @item_drop.item_id = @item.id
       @item_drop.level = level
       @item_drop.skill =skill
       @item_drop.save
     else
       puts "#{mob_no},#{item_no} error!"
     end
     
   end
end