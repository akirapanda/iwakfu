class AddItemSets < ActiveRecord::Migration
  def change
    create_table :item_sets do |t|
      t.string  :english_name
      t.string  :chinese_name
      t.integer :no
      t.integer :level
      t.integer :piece
      t.timestamps
    end
    
    create_table :item_set_stats do |t|
      t.integer :item_set_id
      
      t.integer :piece
      t.text :description
      t.string :skill
      t.integer :skill_id
      t.string :cate
      t.string :stat_type
      t.string :content
      t.decimal :value,:default=>0, :precision => 10, :scale => 2  
      t.boolean :percent,:default => false
      t.boolean :air,:default=>false
      t.boolean :earth,:default=>false
      t.boolean :water,:default=>false
      t.boolean :fire, :default=>false
      t.boolean :visiable,:default =>true
      t.timestamps
      
    end
  end
end
