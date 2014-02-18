class Item < ActiveRecord::Base
  has_many :item_stats,:dependent => :destroy
  has_many :item_stats_effect,->{ where "stat_type = 'effect' "}, class_name:"ItemStat"
  has_many :item_stats_critical,->{ where "stat_type = 'critical' "}, class_name:"ItemStat"
  has_many :item_stats_effect_used,->{ where "stat_type = 'effect' and cate='use' "}, class_name:"ItemStat"
  has_many :item_stats_effect_equipped,->{ where "stat_type = 'effect' and cate= 'equipe' "}, class_name:"ItemStat"
  
  mount_uploader :icon, IconUploader
end
