@url= "http://wakfu-elements.com/itemsets/"

@sets = ItemSet.all

@sets.each do |set|
  begin  
    @html = open(@url+set.no.to_s)
    doc = Nokogiri::HTML(@html)
  
    bonus = doc.css("#itemset_bonus")
    
    children = bonus.children
    
    
    header = ""

    children.each do |node|
      fire = false
      air = false
      water =false
      earth = false
      content = ""
      if node.content.include?"items"
        header = node.content
        next
      elsif not node.content.blank?
        content = node.content.strip
      
        if node.css("img").size > 0
           node.css("img").each do |img|
             if img.attr("src").include?("FIRE")
               fire = true
             elsif img.attr("src").include?("AIR")
               air = true
             elsif img.attr("src").include?("WATER")
               water = true
             elsif img.attr("src").include?("EARTH")
               earth = true
             end
           end
        end
        
        puts "#{set.no},#{header},#{content},#{fire},#{air},#{water},#{earth}" unless header.blank?
      else
        next
      end
      
      
    end

    
  rescue Exception  
    puts "error:#{set.no}"
  end
end
