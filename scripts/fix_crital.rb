@item_stats  = ItemStat.where("content = ?","暴击")


@item_stats.each do |stat|
  description = stat.description
  if description.include?"Damage"
    stat.content = "暴击伤害"
  end
  
  if description.include?"Failures"
    stat.content = "暴击失手"
  end
  
  if description.include?"Hits"
    stat.content = "暴击几率"
  end
  
  stat.save
end

@item_set_stats  = ItemSetStat.where("content = ?","暴击")


@item_set_stats.each do |stat|
  description = stat.description
  if description.include?"Damage"
    stat.content = "暴击伤害"
  end
  
  if description.include?"Failures"
    stat.content = "暴击失手"
  end
  
  if description.include?"Hits"
    stat.content = "暴击几率"
  end
  
  stat.save
end