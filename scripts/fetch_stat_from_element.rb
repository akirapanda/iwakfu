require "open-uri"
require "json"
require "nokogiri"


@basic_url = "http://wakfu-elements.com/items/view/"

@items = Item.joins(:item_type).where("item_types.cate_name = '武器' and items.hidden = false")
@items.each do |item|
    @url = @basic_url + item.no.to_s    
    begin  
      @html = open(@url)
      doc = Nokogiri::HTML(@html)
      item_stat = doc.css("div .itemStatBox")[0]
      item_effect = doc.css("div #itemEffects")[0]
      item_critical = doc.css("div #itemCritical")[0]
      
      if not item_effect.nil?
        
        item_effect_items = item_effect.css("li")
         mode = "use"
          item_effect_items.each do |effect|
            
            if effect.content == "When used:"
              mode = "use"
              next
            elsif effect.content == "When Equipped:"
              mode = "equipe"
              next
            elsif effect.content.blank?
              next
            end
            
            item_stat = ItemStat.new
            item_stat.description = effect.content
            item_stat.item_id = item.id
            item_stat.cate = mode
            item_stat.stat_type = "effect"
            image_flag = []
            if effect.css("img").size > 0
              effect.css("img").each do |img|
                if img.attr("src").include?("FIRE")
                  item_stat.fire = true
                elsif img.attr("src").include?("AIR")
                  item_stat.air = true
                elsif img.attr("src").include?("WATER")
                  item_stat.water = true
                elsif img.attr("src").include?("EARTH")
                  item_stat.earth = true
                end
              end
            end
            item_stat.content = effect.content.split(' ')[1]


            if effect.content.split(' ')[0].include?("%")
              item_stat.percent = true
            end

            item_stat.value = effect.content.split(' ')[0].to_i
            item_stat.save
          end
      end
      
      if not item_critical.nil?
        item_critical_items = item_critical.css("li")
         mode = "use"

          item_critical_items.each do |effect|
            if effect.content == "When used:"
              mode = "use"
              next
            elsif effect.content == "When Equipped:"
              mode = "equipped"
              next
            elsif effect.content.blank?
              next
            end
            item_stat = ItemStat.new
            item_stat.item_id = item.id
            item_stat.cate = mode
            item_stat.description = effect.content
            
            item_stat.stat_type = "critical"
            image_flag = []
            if effect.css("img").size > 0
              effect.css("img").each do |img|
                if img.attr("src").include?("FIRE")
                  item_stat.fire = true
                elsif img.attr("src").include?("AIR")
                  item_stat.air = true
                elsif img.attr("src").include?("WATER")
                  item_stat.water = true
                elsif img.attr("src").include?("EARTH")
                  item_stat.earth = true
                end
              end
            end
            if effect.content.include?("(Critical):")
              trimed_content = effect.content.delete("(Critical):")
            else
              trimed_content = effect.content
            end
            item_stat.content = trimed_content.split(' ')[1]

            if trimed_content.split(' ')[0].include?("%")
              item_stat.percent = true
            end

            item_stat.value = trimed_content.split(' ')[0].to_i
            item_stat.save
            
          end
      end
      rescue Exception  
         puts "error:#{item.no}"
    end
end
    
    
    