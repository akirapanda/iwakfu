require "open-uri"
require "json"
require "nokogiri"


@url = "http://www.wakfu-elements.com/bestiary/view/"

@mobs = Mob.all

@mobs.each do |mob|
  begin
    @html = open(@url+mob.no)
    doc = Nokogiri::HTML(@html)
    item_drops = doc.css("#trapper tbody tr")
    puts item_drops.size
    item_drops.each do |item|
      item_no  = item.css("td")[0].css("img")[0].attr("data-ihover")
      skill = item.css("td")[3].css("span")[0].content.strip.to_s
      level = item.css("td")[3].css("span")[1].css("strong")[0].content.to_i
      puts "#{mob.no},#{item_no},#{skill},#{level}"
    end
    
  rescue Exception  
    
  end

end

