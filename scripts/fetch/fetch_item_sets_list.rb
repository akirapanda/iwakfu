require "open-uri"
require "json"
require "nokogiri"


@url = "http://wakfu-elements.com/itemsets"

@html = open(@url)
doc = Nokogiri::HTML(@html)

table_rows = doc.css(".item_table tr")

table_rows.each do |row|
  cells = row.css("td")
  
  href = cells[0].css("a")[0].attr("href")
  name = cells[0].css("a")[0].content
  piece = cells[1].content
  level = cells[2].content.strip!  
  puts "#{href},#{name},#{piece},#{level}"
end
