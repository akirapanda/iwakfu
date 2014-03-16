require "open-uri"
require "json"
require "nokogiri"
require 'mechanize'


@url = "http://www.wakfu.com/en/mmorpg/game-guide/items/109-equipment?page="
(1..139).each do |i|

agent = Mechanize.new
@html = agent.get @url+i.to_s
doc = Nokogiri::HTML(@html.body)

table = doc.css("#table_list")

trs = table.css(".tr")

trs.each do |row|
  href = row.css("a")[0]
  if href.nil?
    next
  end
  
  url = href.attr("href").strip.to_s
  no = row.css("a")[0].attr("data-item").strip.to_s
  name = row.css("span")[0].css("img")[0].attr("title").strip.to_s
  cate = row.css("span")[1].content.strip.to_s
  level = row.css("span")[2].content.strip.to_i
  
  puts "#{no},#{name},#{cate},#{level},#{url}"
end

end
