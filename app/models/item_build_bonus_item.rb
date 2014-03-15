class ItemBuildBonusItem < ActiveRecord::Base

  belongs_to :item_build
  belongs_to :item_set_detail
end