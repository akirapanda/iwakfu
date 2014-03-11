class Mob < ActiveRecord::Base
  mount_uploader :icon, IconUploader
end
