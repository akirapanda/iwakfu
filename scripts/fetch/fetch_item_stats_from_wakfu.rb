require "open-uri"
require "json"
require "nokogiri"
require 'mechanize'



def fetch(no,url)
  
  @url = "http://www.wakfu.com"+url.to_s

   agent = Mechanize.new
   @html = agent.get @url
   doc = Nokogiri::HTML(@html.body)

   stats_li = doc.css("#tab_carac li")
   
   stats_li.each do |stats|
     images = stats.css("img")
     if images.any?
       fire = false
       earth = false
       air = false
       water = false
       images.each do |image|
         src = image.attr("src")
         if src.include?"WATER"
           water = true
         end
         if src.include?"FIRE"
           fire = true
         end
         if src.include?"EARTH"
           earth = true
         end
         if src.include?"AIR"
           air = true
         end
       end
     end
     content = stats.content.strip.to_s
     puts "#{no},#{content},#{fire},#{earth},#{air},#{water}"
     sleep(5)
   end
   
end




filename= "scripts/check/miss_item_list.csv"

File.open(filename, "r") do |file| 
   while line=file.gets
     item_no = line.split(",")[0]
     url = line.split(",")[4]
     fetch(item_no,url)
     
     
  end
end