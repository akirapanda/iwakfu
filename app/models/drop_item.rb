class DropItem < ActiveRecord::Base
  belongs_to :mob
  belongs_to :item
end