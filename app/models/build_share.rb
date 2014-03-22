class BuildShare < ActiveRecord::Base
  belongs_to :item_build
  validates :name,:presence => true
  
end