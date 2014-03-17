@item_stats  = ItemStat.where("content = ?","抗性")


@item_stats.each do |stat|
  description = stat.description
  if description.include?"AP loss"
    stat.content = "行动力损失抗性"
  end
  
  if description.include?"MP loss"
    stat.content = "移动力损失抗性"
  end
  
  if description.include?"attacks from behind"
    stat.content = "背刺抗性"
  end
  
  if description.include?"Resist. (CH)"
    stat.content = "暴击抗性"
  end
  
  if description.include?"heals"
    stat.content = "治疗抗性"
  end
  
  stat.save
end

@item_set_stats  = ItemSetStat.where("content = ?","抗性")


@item_set_stats.each do |stat|
  description = stat.description
  
  if description.include?"AP loss"
    stat.content = "行动力损失抗性"
  end
  
  if description.include?"MP loss"
    stat.content = "移动力损失抗性"
  end
  
  if description.include?"attacks from behind"
    stat.content = "背刺抗性"
  end
  
  if description.include?"Resist. (CH)"
    stat.content = "暴击抗性"
  end
  
  if description.include?"heals"
    stat.content = "治疗抗性"
  end
  
  stat.save
end