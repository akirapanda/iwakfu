
require "open-uri"
require "json"
require "nokogiri"
require 'mechanize'

@url = "http://www.wakfu.com/en/mmorpg/game-guide/bestiary/436-ultimate-bosses/42-magmog-gobbalrog"

  agent = Mechanize.new
  @html = agent.get @url
  doc = Nokogiri::HTML(@html.body)

  table = doc.css("#table_list")

  
  if doc.css(".lifepoints")[0]
    life = doc.css(".lifepoints")[0].content.strip.to_i
  end
  if doc.css(".pa")[0]
    ap = doc.css(".pa")[0].content.strip.to_i
  end
  if doc.css(".pm")[0]
    mp = doc.css(".pm")[0].content.strip.to_i
  end
  if doc.css(".wakfu")[0]
    wp = doc.css(".wakfu")[0].content.strip.to_i
  end
  if doc.css(".init")[0]
    init = doc.css(".init")[0].content.strip.to_i
  end
  if doc.css(".tackle")[0]
    lock = doc.css(".tackle")[0].content.strip.to_i
  end
  if doc.css(".esquive")[0]
    dodge = doc.css(".esquive")[0].content.strip.to_i
  end
  if doc.css(".parade")[0]
    block = doc.css(".parade")[0].content.strip.to_i
  end
  if doc.css(".perception")[0]
    perception = doc.css(".perception")[0].content.strip.to_i
  end
  if doc.css(".boostcritical")[0]
    crit = doc.css(".boostcritical")[0].content.strip.to_i
  end
  
  stats = doc.css(".stat")
  
  water_damage = stats[0].css("span")[0].content.strip.to_i
  water_resist = stats[1].css("span")[0].content.strip.to_i
  earth_damage = stats[2].css("span")[0].content.strip.to_i
  earth_resist = stats[3].css("span")[0].content.strip.to_i
  air_damage = stats[4].css("span")[0].content.strip.to_i
  air_resist = stats[5].css("span")[0].content.strip.to_i
  fire_damage = stats[6].css("span")[0].content.strip.to_i
  fire_resist = stats[7].css("span")[0].content.strip.to_i
  
  capture = doc.css(".catchable strong")[0].content.strip.to_s
  capture_able = false
  if capture == "No"
    capture_able = false
  else
    capture_able = true
  end
  
  puts "#{life},#{ap},#{mp},#{wp},#{init},#{lock},#{dodge},#{block},#{perception},#{crit},#{water_damage},#{water_resist},#{earth_damage},#{earth_resist},#{air_damage},#{air_resist},#{fire_damage},#{fire_resist},#{capture_able}"

  list_items = doc.css(".list_item .item")
  drop_spans = doc.css(".list_item .subtitle")
  level_spans = doc.css(".list_item .level")
  
  
  if list_items.any?
    list_items.each_with_index do |item,i|
      if i >= drop_spans.size
        next
      end
      
      
      item_no = item.attr("data-item")
      drop_info = drop_spans[i].content.strip.to_s
      item_level = level_spans[i].content.strip.delete("lvl. ").to_i
      
      
      drop_rate = drop_info.split("%")[0].delete("Drop:  ").to_f
      if drop_info.split("%").size > 1
        prop_lock = drop_info.split("%")[1].delete("Prospecting: ").to_i
      end
      
      puts "#{item_no},#{drop_info},#{drop_rate},#{prop_lock},#{item_level}"
    end
  end
  