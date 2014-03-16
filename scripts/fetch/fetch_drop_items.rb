require "open-uri"
require "json"
require "nokogiri"


@url = "http://www.wakfu-elements.com/bestiary/view/"

@mobs = Mob.where("id = ?",1225)

@mobs.each do |mob|
  
    @html = open(@url+mob.no)
    doc = Nokogiri::HTML(@html)
    item_drops = doc.css("#itemdrops tbody tr")
    
    item_drops.each do |item|
      item_no  = item.css("td")[0].css("img")[0].attr("data-ihover")
      rate = item.css("td")[2].content.to_f
      lock = item.css("td")[3].content.to_i
      
      puts "#{mob.no},#{item_no},#{rate},#{lock}"
    end
    


end

