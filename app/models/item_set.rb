class ItemSet < ActiveRecord::Base
  has_many :items
  has_many :item_set_stats
  has_many :item_set_stats_1,->{ where "piece = 1 and cate = 'bonus' "}, class_name:"ItemSetStat"
  has_many :item_set_stats_2,->{ where "piece = 2 and cate = 'bonus'"}, class_name:"ItemSetStat"
  has_many :item_set_stats_3,->{ where "piece = 3 and cate = 'bonus' "}, class_name:"ItemSetStat"
  has_many :item_set_stats_4,->{ where "piece = 4 and cate = 'bonus' "}, class_name:"ItemSetStat"
  has_many :item_set_stats_5,->{ where "piece = 5 and cate = 'bonus' "}, class_name:"ItemSetStat"
  has_many :item_set_stats_6,->{ where "piece = 6 and cate = 'bonus' "}, class_name:"ItemSetStat"
  has_many :item_set_stats_7,->{ where "piece = 7 and cate = 'bonus' "}, class_name:"ItemSetStat"
  has_many :item_set_stats_8,->{ where "piece = 8 and cate = 'bonus' "}, class_name:"ItemSetStat"
  has_one :item_set_detail
  
  def total
    
  end
  
  
end