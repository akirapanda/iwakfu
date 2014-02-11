require 'carrierwave/orm/activerecord'

class MobFamily < ActiveRecord::Base
  validates :name, uniqueness: true
  mount_uploader :icon, IconUploader
  
end
