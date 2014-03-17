filenames =["wakfu_item_stats.csv"]




def set_stat_with_description(item_stat)
  if item_stat.blank?
    return 
  end
  
  value = item_stat.description.split(" ")[0]
  if value.include?"%"
    item_stat.percent = true
  end
  
  value = value.delete("%").to_f
  
  item_stat.value = value
  if item_stat.description.include?"HP"
    item_stat.content = "生命值"
  elsif item_stat.description.include?"CMC Damage"
    item_stat.content = "召唤物伤害"
  elsif item_stat.description.include?"Backstab Damage"
    item_stat.content = "背刺伤害"  
  elsif item_stat.description.include?"Critical Hit Damage"
    item_stat.content = "暴击伤害"
  elsif item_stat.description.include?"Critical Failures"
     item_stat.content = "暴击失手" 
    
  elsif item_stat.description.include?"Damage"
    item_stat.content = "伤害"  
    if item_stat.fire == false && item_stat.water == false  && item_stat.air == false && item_stat.earth == false
      item_stat.fire = true
      item_stat.water = true
      item_stat.air = true
      item_stat.earth = true
    end
  elsif  item_stat.description.include?"Block" 
    item_stat.content = "锁定"
  elsif item_stat.description.include?"Lock" 
    item_stat.content = "格挡"
  elsif item_stat.description.include?"Lock" 
    item_stat.content = "格挡"
  elsif item_stat.description.include?"Initiative" 
    item_stat.content = "先手"   
  elsif item_stat.description.include?"Dodge" 
    item_stat.content = "闪避"
  elsif item_stat.description.include?"Intelligence" 
    item_stat.content = "智慧之火"
  elsif item_stat.description.include?"Chance" 
    item_stat.content = "幸运之水"    
  elsif item_stat.description.include?"Strength" 
    item_stat.content = "坚韧之地"    
  elsif item_stat.description.include?"Agility" 
    item_stat.content = "敏捷之风"
  elsif item_stat.description.include?"of removing AP" 
    item_stat.content = "剥夺行动力"
  elsif item_stat.description.include?"Range" 
    item_stat.content = "射程"
  elsif item_stat.description.include?"Wisdom" 
    item_stat.content = "悟性"      
  elsif item_stat.description.include?"Control" 
    item_stat.content = "统率"   
  elsif item_stat.description.include?"Perception" 
    item_stat.content = "洞察"    
  elsif item_stat.description.include?"Prospecting" 
    item_stat.content = "勘探"   
  elsif item_stat.description.include?"Willpower" 
    item_stat.content = "意志"
  elsif item_stat.description.include?"Heals" 
    item_stat.content = "治疗"  
  elsif item_stat.description.include?"Critical Hits" 
    item_stat.content = "暴击几率"  
  elsif item_stat.description.include?"Resist. to AP loss" 
    item_stat.content = "行动力损失抗性"  
  elsif item_stat.description.include?"Resist. to MP loss" 
    item_stat.content = "移动力损失抗性"  
  elsif item_stat.description.include?"Resist. to attacks from behind" 
    item_stat.content = "背刺抗性"
  elsif item_stat.description.include?"Resist. to heals" 
    item_stat.content = "治疗抗性"     
  elsif item_stat.description.include?"Resist" 
    item_stat.content = "抗性"    
    if item_stat.fire == false && item_stat.water == false  && item_stat.air == false && item_stat.earth == false
      item_stat.fire = true
      item_stat.water = true
      item_stat.air = true
      item_stat.earth = true
    end
  elsif item_stat.description.include?"AP" 
    item_stat.content = "行动力"    
  elsif item_stat.description.include?"MP" 
    item_stat.content = "移动力"  
  elsif item_stat.description.include?"WP" 
    item_stat.content = "创生力"    
  elsif item_stat.description.include?"Lvl. to  spells" 
    item_stat.content = "技能等级"  
    if item_stat.fire == false && item_stat.water == false  && item_stat.air == false && item_stat.earth == false
      item_stat.fire = true
      item_stat.water = true
      item_stat.air = true
      item_stat.earth = true
    end
  else
    puts item_stat.description
  end
  return item_stat
  
  
end



filenames.each do |filename|
  File.open(filename, "r") do |file|  
     while line=file.gets
       no  = line.split(",")[0]
       description = line.split(",")[1]
       fire = line.split(",")[2]
       
       earth  = line.split(",")[3]
       air  = line.split(",")[4]
       water= line.split(",")[5]
       
       
       item = Item.where("no = ?",no)[0]
       if item.nil?
         puts "#{no},error"
       else         
         item_stat = ItemStat.new
         item_stat.item_id = item.id
         item_stat.description = description
         item_stat.cate = "equipe"
         item_stat.cate = "stat_type"
         
         if fire == "true"
           item_stat.fire = true
         else
           item_stat.fire = false
         end 
         
         if earth == "true"
           item_stat.earth = true
         else
           item_stat.earth = false
         end
         
         if air == "true"
           item_stat.air = true
         else
           item_stat.air = false
         end
         
         if water == "true"
           item_stat.water = true
         else
           item_stat.water = false
         end
         set_stat_with_description(item_stat)
         item_stat.save
       end

     end
  end
end