filename= "scripts/item_drop.csv"

File.open(filename, "r") do |file|  
   while line=file.gets
     mob_no  = line.split(",")[0].strip.to_s
     item_no = line.split(",")[1].strip
     
     @mob = Mob.where("no=?",mob_no)[0]
     @item = Item.where("no=?",item_no)[0]
     rate = line.split(",")[2].to_f
     lock =line.split(",")[3].strip.to_i
     
     if @mob && @item
       @item_drop = DropItem.new
       @item_drop.mob_id = @mob.id
       @item_drop.item_id = @item.id
       @item_drop.rate = rate
       @item_drop.lock =lock
       @item_drop.save
     else
       puts "#{mob_no},#{item_no} error!"
     end
     
   end
end