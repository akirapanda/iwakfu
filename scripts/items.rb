require "open-uri"
require "json"
require "nokogiri"



@basic_url = "http://wakfu-elements.com/items/view/"
@id = 12
@url = @basic_url + @id.to_s
begin  
  @html = open(@url)
rescue Exception  
  exit
end

doc = Nokogiri::HTML(@html)

item = doc.css("div .itemWrapper")[0]
rare = item.css(".itemUpperName span")[0].attr('class')
name = item.css("h3")[0].content
icon_url = item.css(".itemImgLarge img")[0].attr('src')

level = 0
if item.css(".itemLevel").size > 0
  level = item.css(".itemLevel")[0].content.strip!
end


if item.css(".itemUsageRules span").size > 0
  ap = item.css(".itemUsageRules span")[0].content
  range = item.css(".itemUsageRules span")[1].content
end
gems_count = item.css(".itemGems img").size
desc = item.css(".description")[0].content.strip!

type = ""
infos = item.css(".itemFacts").css("li")
infos.each do |info|
  if info.css("span")[0].content.include?"Type"  
    type = info.css("a")[0].content
  end
end

filename = icon_url.split('/').last


@item = Item.new
@item.name = name
@item.write_uploader('icon', filename) 
@item.level = level
@item.slot = gems_count
@item.item_type = type
@item.content = desc
@item.quanlity = rare
@item.action_point = ap
@item.move_point = 0
@item.will_point = 0
if not range.blank?
  @item.min_range = range.split('-')[0]
  @item.max_range = range.split('-')[1]
end
puts filename
@item.save


data=open(icon_url){|f|f.read}
filepath = "public/uploads/item/icon/#{@item.id}/#{filename}"
if(File.exist?("public/uploads/item/icon/#{@item.id}"))
 puts "folder structure already exist!"
else
  Dir.mkdir("public/uploads/item/icon/#{@item.id}") #if folder not exist,then creat it.
end
open(filepath,"wb"){|f|f.write(data)}