@url= "http://wakfu-elements.com/itemsets/"

@sets = ItemSet.all

@sets.each do |set|
  begin  
  
    @html = open(@url+set.no.to_s)
    doc = Nokogiri::HTML(@html)
  
    table_rows = doc.css(".item_table tr")

    table_rows.each do |row|
      cells = row.css("td")

      href = cells[0].css("a")[0].attr("href")
      name = cells[0].css("a")[0].content
      part = cells[2].content

      puts "#{set.no},#{href},#{name},#{part}"

    end
    
  rescue Exception  
    puts "error:#{set.no}"
  end
  
end





