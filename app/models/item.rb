class Item < ActiveRecord::Base
  mount_uploader :icon, IconUploader
end
