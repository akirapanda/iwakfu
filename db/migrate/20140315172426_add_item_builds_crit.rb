class AddItemBuildsCrit < ActiveRecord::Migration
  def change
    add_column :item_builds, :crit_fail,:integer
    add_column :item_builds, :crit_damage,:integer
    
  end
end
