class Mob < ActiveRecord::Base
  mount_uploader :icon, IconUploader
  has_many :drop_items
  has_many :trapper_items
end
