@items = Item.where(:hidden=>false)

@items.each do |item|
  if item.info.nil?
    next
  end
  
  
  if item.info.include?"One-Handed"
    item.main_hand = true
    item.second_hand = false
    item.double_hand = false
    item.save
  elsif item.info.include?"Two-Handed"
    item.main_hand = false
    item.second_hand = false
    item.double_hand = true
    item.save
  elsif item.info.include?"Second"
    if item.item_type_id == 6
      item.main_hand = true
    end
    item.second_hand = true
    item.double_hand = false
    item.save
  else
    next
  end
end