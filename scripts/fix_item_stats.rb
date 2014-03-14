@item_stats  = ItemStat.where("content = ?","max")


@item_stats.each do |stat|
  content = @item_stat.description.split(" ")[2].strip.to_s
  case content
  when 'AP'
    stat.content = "行动力"
  when 'MP'
    stat.content = "移动力"
  when 'HP'
    stat.content = "生命值"
  end
  
  if stat.content == "of"
    stat.content = "剥夺行动力"
  end
  stat.save
end

# of => 剥夺行动力
# under 各种各样的技能影响
