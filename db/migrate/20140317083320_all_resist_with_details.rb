class AllResistWithDetails < ActiveRecord::Migration
  def change
    add_column :item_details, :crit_resist,:integer
    add_column :item_set_details, :crit_resist,:integer,:default=>0
    add_column :item_builds, :crit_resist,:integer,:default=>0
    
    add_column :item_details, :ap_resist,:integer
    add_column :item_set_details, :ap_resist,:integer,:default=>0
    add_column :item_builds, :ap_resist,:integer,:default=>0
    
    add_column :item_details, :mp_resist,:integer
    add_column :item_set_details, :mp_resist,:integer,:default=>0
    add_column :item_builds, :mp_resist,:integer
    
    add_column :item_details, :back_resist,:integer
    add_column :item_set_details, :back_resist,:integer,:default=>0
    add_column :item_builds, :back_resist,:integer,:default=>0
    
    add_column :item_details, :heals_resist,:integer
    add_column :item_set_details, :heals_resist,:integer,:default=>0
    add_column :item_builds, :heals_resist,:integer,:default=>0
  end
  
end
