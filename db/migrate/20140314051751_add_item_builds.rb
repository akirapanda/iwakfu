class AddItemBuilds < ActiveRecord::Migration
  def change
    create_table :item_builds do |t|
      t.string :name
      t.integer :header_id
      t.integer :shoulder_id
      t.integer :neck_id
      t.integer :left_ring_id
      t.integer  :right_ring_id
      
      t.integer  :body_id
      t.integer  :foot_id
      t.integer  :cloak_id
      t.integer :belt_id
      t.integer :left_hand_id
      
      t.integer :right_hand_id
      t.integer :pet_id
      t.integer :medal_id
      
      t.integer :user_id
      t.boolean :hidden, :default=>true
      
      
      
      
      t.integer :hp,:default=>0
      t.integer :ap,:default=>0
      t.integer :mp,:default=>0
      t.integer :wp,:default=>0
    
      t.integer :initiative,:default=>0
      t.integer :dodge,:default=>0
      t.integer :lock,:default=>0
      t.integer :backstab,:default=>0
      t.integer :critical,:default=>0
      t.integer :block,:default=>0
    
      t.integer :control,:default=>0
      t.integer :cmc,:default=>0
      t.integer :will_power,:default=>0
      t.integer :prospecting,:default=>0
      t.integer :perception,:default=>0
      t.integer :heals,:default=>0
      t.integer :wisdom,:default=>0
    
      t.integer :range ,:default=>0
      t.integer :remove_ap ,:default=>0
    
    
      t.integer :fire_damage,:default=>0
      t.integer :earth_damage,:default=>0
      t.integer :water_damage,:default=>0
      t.integer :air_damage,:default=>0
    
      t.integer :fire_resist,:default=>0
      t.integer :earth_resist,:default=>0
      t.integer :water_resist,:default=>0
      t.integer :air_resist,:default=>0
    
      t.integer :fire_skill,:default=>0
      t.integer :earth_skill,:default=>0
      t.integer :water_skill,:default=>0
      t.integer :air_skill,:default=>0
    
      t.integer :fire,:default=>0
      t.integer :water,:default=>0
      t.integer :earth,:default=>0
      t.integer :air,:default=>0
      
      t.timestamps
    end
  end
end
