require "open-uri"
require "json"
require "nokogiri"

filename= "scripts/fetch/item_sets_list.csv"
@url = "http://wakfu.94zl.com/Item/Set?id="


File.open(filename, "r") do |file|  
   while line=file.gets
     no = line.split(',')[0]
     eng_name = line.split(',')[1]
     begin
       @html = open(@url+no)
       doc = Nokogiri::HTML(@html)
       chinese_name = doc.css("#M_mc")[0].content
     
       puts "#{no},#{eng_name},#{chinese_name}"
      rescue Exception  
        puts "error:#{no}"
      end       
   end
end






