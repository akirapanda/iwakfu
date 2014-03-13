class Recipe < ActiveRecord::Base
  belongs_to :item
  has_many :recipe_items
end