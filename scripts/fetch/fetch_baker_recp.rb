require "open-uri"
require "json"
require "nokogiri"


@url = "http://wakfu-elements.com/professions/"
@skill_array =[["40","烘焙"],["64","种植"],["67","造币"],["68","近战武器制作"],["69","远程武器制作"],["70","魔法武器制作"],["71","伐木"],["72","草药"],
              ["73","挖矿"],["74","畜牧"],["75","钓鱼"],["76","厨师"],["77","制甲"],["78","珠宝"],["79","裁缝"],
              ["80","皮匠"],["81","工匠"],["82","其他"]]
             


@skill_array.each do |skill_cate|

  begin
    @html = open(@url+skill_cate[0].to_s)
    doc = Nokogiri::HTML(@html)
    item_drops = doc.css(".items_table tr")
  
    item_drops.each do |item|
      recipe_no = item.css("td")[0].css("a")[0].attr("href").delete("/items/view/").strip.to_s
      name = item.css("td")[0].css("a")[0].content.strip.to_s
      quantity  = item.css("td")[0].css("a")[0].content.strip.to_s.split(' x')[1].to_i
    
      quantity = 1 if quantity == 0
      level = item.css("td")[1].content.to_i
      skill =  skill_cate [1]
      need_items = item.css("td")[3].css("div")
    
      need_items.each do |need_item|
        need_item_no  = need_item.css("img")[0].attr("data-ihover")
        item_count = need_item.content.strip.to_s.split(' x')[1].to_i
        puts "#{recipe_no},#{name},#{quantity},#{level},#{skill},#{need_item_no},#{item_count}"
      end
    end
    
  end
end