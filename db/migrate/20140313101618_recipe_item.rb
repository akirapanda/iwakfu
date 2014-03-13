class RecipeItem < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :item_id
      t.string :name
      t.string :skill
      t.integer :level
      t.integer :quantity
      
      t.timestamp
    end
    
    create_table :recipe_items do |t|
      t.integer :item_id
      t.integer :recipe_id
      
      t.integer :quantity
      t.string :skill
      
      t.timestamp
    end
  end
end
