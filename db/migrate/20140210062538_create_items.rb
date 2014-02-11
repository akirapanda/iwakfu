class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :icon
      t.string :name
      t.string :slot
      t.integer :item_type_id
      t.string :item_type
      t.text :content
      t.text :info
      t.integer :level
      t.string :quanlity
      t.integer :action_point
      t.integer :move_point
      t.integer :will_point
      t.integer :min_range
      t.integer  :max_range
      t.timestamps
    end
    
    create_table :mobs do |t|
      t.string :icon
      t.string :name
      t.integer :mob_family_id
      t.integer :hp
      t.integer :mp
      t.integer :wp
      t.integer :ap
      t.integer :init
      t.integer :lock
      t.integer :dodge
      t.integer :block
      t.integer :crit
      t.integer :earth_resist
      t.integer :fire_resist
      t.integer :water_resist
      t.integer :air_resist
      t.integer :earth_damage
      t.integer :fire_damage
      t.integer :water_damage
      t.integer :air_damage
      t.boolean :capture_flag,:default=>false
      t.timestamps
    end
    
    
    create_table :mob_families do |t|
      t.string :name
      t.string :icon
      t.timestamps
    end
  end
end
