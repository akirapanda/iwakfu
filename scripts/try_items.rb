require "open-uri"
require "json"
require "nokogiri"

@basic_url = "http://wakfu-elements.com/items/view/"
file = File.new("item-list.txt","a")
(1000...1500).each do |i|
  begin  
    puts "try #{i}"
    @url = @basic_url + i.to_s
    @html = open(@url)
    file.puts "#{i}"
  rescue Exception  
    next
  end
end
file.close