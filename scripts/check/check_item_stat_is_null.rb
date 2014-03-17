weapons = ["Two-Handed Weapons","Necklace","Ring","Boots","Cloak","Belt","Helmet","One-Handed Weapons","Epaulettes","Second Hand","Breastplate","Weapons"]
@items = Item.where("hidden = false and info in (?)",weapons)

@items.each do |item|
  if item.item_stats.empty?
    puts "#{item.no}"
  end
end