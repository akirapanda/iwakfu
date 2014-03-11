require "open-uri"
require "json"
require "nokogiri"


@url = "http://www.wakfu-elements.com/bestiary/view/"

@mobs = Mob.all

@mobs.each do |mob|
  begin
    @html = open(@url+mob.no)
    doc = Nokogiri::HTML(@html)

    image_div = doc.css(".npc-image")

    icon_url = image_div.css("img")[0].attr("src")
    npc_cost = image_div.css(".npc-cost")
    mob.ap = npc_cost.css("div")[0].content.strip.to_i
    mob.mp = npc_cost.css("div")[1].content.strip.to_i
    mob.wp = npc_cost.css("div")[2].content.strip.to_i
    

    npc_stat = doc.css(".npc-stats")
    mob.level = npc_stat.css("h4")[0].content.strip.delete("Level").to_i

    capture_able = npc_stat.css(".tameable").attr("src").to_s
    if capture_able.include?("tameable1")
      mob.capture_flag = 1
    else
      mob.capture_flag = 0
    end


    mob.hp = npc_stat.css(".one4")[0].content.strip.to_i
    mob.init = npc_stat.css(".one4")[1].content.strip.to_i
    mob.lock = npc_stat.css(".one4")[2].content.strip.to_i
    mob.dodge = npc_stat.css(".one4")[3].content.strip.to_i
    mob.block = npc_stat.css(".one4")[4].content.strip.to_i
    mob.crit = npc_stat.css(".one4")[5].content.strip.to_i

    mob.earth_resist = npc_stat.css(".one4")[6].content.strip.to_i
    mob.earth_damage = npc_stat.css(".one4")[6].content.strip.to_i
    mob.fire_resist = npc_stat.css(".one4")[6].content.strip.to_i
    mob.fire_damage = npc_stat.css(".one4")[6].content.strip.to_i
    mob.water_resist = npc_stat.css(".one4")[6].content.strip.to_i
    mob.water_damage = npc_stat.css(".one4")[6].content.strip.to_i
    mob.air_resist = npc_stat.css(".one4")[6].content.strip.to_i
    mob.air_damage = npc_stat.css(".one4")[6].content.strip.to_i


    stats = npc_stat.css(".one4")
    mob.hp = stats[0].content.strip.to_i



    filename = icon_url.split('/').last
    mob.write_uploader('icon', filename) 
    mob.save
    data = open("http://wakfu-elements.com"+icon_url){|f|f.read}
    filepath = "public/uploads/mob/icon/#{mob.id}/#{filename}"
    if(File.exist?("public/uploads/mob/icon/#{mob.id}"))
     puts "folder structure already exist!"
    else
      Dir.mkdir("public/uploads/mob/icon/#{mob.id}") #if folder not exist,then creat it.
    end
    open(filepath,"wb"){|f|f.write(data)}
  rescue Exception  
    puts "error:#{mob.no}"
  end

end

