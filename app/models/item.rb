class Item < ActiveRecord::Base
  has_many :item_stats,:dependent => :destroy
  has_many :item_stats_effect,->{ where "stat_type = 'effect' "}, class_name:"ItemStat"
  has_many :item_stats_critical,->{ where "stat_type = 'critical' "}, class_name:"ItemStat"
  has_many :item_stats_effect_used,->{ where "stat_type = 'effect' and cate='use' "}, class_name:"ItemStat"
  has_many :item_stats_effect_equipped,->{ where "stat_type = 'effect' and cate= 'equipe' "}, class_name:"ItemStat"
  
  has_one :item_detail
  has_many :drop_items
  has_many :trapper_items
  has_many :recipes
  has_many :recipe_items
  
  belongs_to :item_type
  mount_uploader :icon, IconUploader
  
  
  def short
    "#{name}[等级#{level}]"
  end
end
