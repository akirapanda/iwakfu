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
  belongs_to :item_set
  belongs_to :item_type
  mount_uploader :icon, IconUploader
  WEAPONS=["斧","斧子","锤","魔杖","单手剑","铲","匕首","单手杖","锤子","针","弓","双手剑","双手杖","卡牌","盾牌"]
  DOUDLE_HAND=["斧","斧子","锤","弓","锤子","双手剑","双手杖"]
  LEFT_HAND=["盾牌","匕首"]
  RIGHT_HAND=["卡牌","针","单手剑","魔杖","匕首","单手杖"]
  QUANLITIES=["rare-green","rare-grey","rare-white","rare-orange","rare-yellow","rare-purple","rare-unknown"]
  
  def short
    "#{name}[等级#{level}]"
  end
end
