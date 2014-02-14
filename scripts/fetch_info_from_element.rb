require "open-uri"
require "json"
require "nokogiri"


@basic_url = "http://wakfu-elements.com/items/view/"

@items = Item.where("id > 0 and id <10")
@items.each do |item|
  
  if item.item_type.nil?
    puts "update #{item.name}"
    @url = @basic_url + item.no.to_s
    begin  
      @html = open(@url)
      doc = Nokogiri::HTML(@html)

      item_wrap = doc.css("div .itemWrapper")[0]
      rare = item_wrap.css(".itemUpperName span")[0].attr('class')
      icon_url = item_wrap.css(".itemImgLarge img")[0].attr('src')

      level = 0
      if item_wrap.css(".itemLevel").size > 0
        level = item_wrap.css(".itemLevel")[0].content.strip!
      end


      if item_wrap.css(".itemUsageRules span").size > 0
        ap = item_wrap.css(".itemUsageRules span")[0].content
        range = item_wrap.css(".itemUsageRules span")[1].content
      end
      gems_count = item_wrap.css(".itemGems img").size
      desc = item_wrap.css(".description")[0].content.strip!

      type = ""
      infos = item_wrap.css(".itemFacts").css("li")
      infos.each do |info|
        if info.css("span")[0].content.include?"Type"  
          type = info.css("a")[0].content
        end
      end

      filename = icon_url.split('/').last


      item.write_uploader('icon', filename) 
      item.level = level
      item.slot = gems_count
      item.item_type = type
      item.quanlity = rare
      item.action_point = ap
      item.move_point = 0
      item.will_point = 0
      if not range.blank?
        item.min_range = range.split('-')[0]
        item.max_range = range.split('-')[1]
      end
      puts filename
      item.save


      data=open(icon_url){|f|f.read}
      filepath = "public/uploads/item/icon/#{item.id}/#{filename}"
      if(File.exist?("public/uploads/item/icon/#{item.id}"))
       puts "folder structure already exist!"
      else
        Dir.mkdir("public/uploads/item/icon/#{item.id}") #if folder not exist,then creat it.
      end
      open(filepath,"wb"){|f|f.write(data)}
      
    rescue Exception  
      puts "#{item.no} error!"
    end
  end
end


