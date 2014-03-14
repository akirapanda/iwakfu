class AddItemDetails < ActiveRecord::Migration
  def change
    create_table :item_details do |t|
    
      t.integer :item_id
      t.integer :hp
      t.integer :ap
      t.integer :mp
      t.integer :wp
    
      t.integer :initiative
      t.integer :dodge
      t.integer :lock
      t.integer :backstab
      t.integer :critical
      t.integer :block
    
      t.integer :control
      t.integer :cmc
      t.integer :will_power
      t.integer :prospecting
      t.integer :perception
      t.integer :heals
      t.integer :wisdom
    
      t.integer :range 
      t.integer :remove_ap 
    
    
      t.integer :fire_damage
      t.integer :earth_damage
      t.integer :water_damage
      t.integer :air_damage
    
      t.integer :fire_resist
      t.integer :earth_resist
      t.integer :water_resist
      t.integer :air_resist
    
      t.integer :fire_skill
      t.integer :earth_skill
      t.integer :water_skill
      t.integer :air_skill
    
      t.integer :fire
      t.integer :water
      t.integer :earth
      t.integer :air
    
      t.timestamps
    end
  end
end