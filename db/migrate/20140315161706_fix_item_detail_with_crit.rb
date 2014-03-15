class FixItemDetailWithCrit < ActiveRecord::Migration
  def change
    add_column :item_details, :crit_damage,:integer
    add_column :item_set_details, :crit_damage,:integer,:default=>0
    
    add_column :item_details, :crit_fail,:integer
    add_column :item_set_details, :crit_fail,:integer,:default=>0
    
  end
end
