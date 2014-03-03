@url= "http://wakfu-elements.com/itemsets/"
@html = open(@url+set.no.to_s)
doc = Nokogiri::HTML(@html)

bonus = doc.css("#itemset_bonus")