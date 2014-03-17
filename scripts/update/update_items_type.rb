@items = Item.where("item_type_id is null")

@items.each do |item|
  if item.info.include?"Breastplate"
    item.item_type_id = 16

  end
end