@items = Item.all

@items.each do |item|

item.item_stats.each do |stat|
  if stat.cate == "use"
    next
  end
  
  
  content = stat.content
  @detail = ItemDetail.where("item_id = ?",item.id)[0]
  
  if @detail.nil?
    @detail = ItemDetail.new
    @detail.item_id = item.id
  end
  
  case content
  when '生命值' 
    @detail.hp = stat.value
  when '伤害' 
    if stat.fire 
      @detail.fire_damage = stat.value
    end
    if stat.water 
      @detail.water_damage = stat.value
    end
    if stat.earth 
      @detail.earth_damage = stat.value
    end
    if stat.air
      @detail.air_damage = stat.value 
    end
  when '锁定' 
    @detail.lock = stat.value
  when '先手' 
    @detail.initiative = stat.value
  when '闪避' 
    @detail.dodge = stat.value
  when '智慧之火'
    @detail.fire = stat.value
  when '抗性' 
    if stat.fire 
      @detail.fire_resist = stat.value
    end
    if stat.water 
      @detail.water_resist = stat.value
    end
    if stat.earth 
      @detail.earth_resist = stat.value
    end
    if stat.air
      @detail.air_resist = stat.value 
    end
  when '背刺伤害'
    @detail.backstab = stat.value
  when '暴击' 
    @detail.critical = stat.value
  when '格挡' 
    @detail.block = stat.value
  when '行动力' 
    @detail.ap = stat.value
  when '移动力'
    @detail.mp = stat.value 
  when '创生力' 
    @detail.wp = stat.value 
  when '统帅' 
    @detail.control = stat.value 
  when '洞察' 
    @detail.perception = stat.value 
  when '意志' 
    @detail.will_power = stat.value 
  when '勘探' 
    @detail.prospecting = stat.value 
  when '治疗' 
    @detail.heals = stat.value 
  when '悟性' 
    @detail.wisdom = stat.value 
  when '幸运之水'
    @detail.water = stat.value 
    
  when '召唤物伤害'
    @detail.cmc = stat.value 
  when '坚韧之地'
    @detail.earth = stat.value 
    
  when '射程'
    @detail.range = stat.value 
    
  when '技能等级'
    if stat.fire 
      @detail.fire_skill = stat.value
    end
    if stat.water 
      @detail.water_skill = stat.value
    end
    if stat.earth 
      @detail.earth_skill = stat.value
    end
    if stat.air
      @detail.air_skill = stat.value 
    end
  when '敏捷之风'   
    @detail.air = stat.value 
    
  when '剥夺行动力'   
    @detail.remove_ap = stat.value 

  end
  
  @detail.save
  
end

end