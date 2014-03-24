class Guild < ActiveRecord::Base
  validates :name,:presence => true
  
end