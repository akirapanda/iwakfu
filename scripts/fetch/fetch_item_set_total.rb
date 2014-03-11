require "open-uri"
require "json"
require "nokogiri"

@url= "http://wakfu-elements.com/itemsets/451"
@html = open(@url)
doc = Nokogiri::HTML(@html)

total = doc.css("#itemsetTotal")


total.children
  
  fire = false
  air = false
  water =false
  earth = false
  content = ""
  
  contents = node.content.strip

