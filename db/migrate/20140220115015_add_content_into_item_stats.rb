class AddContentIntoItemStats < ActiveRecord::Migration
  def change
    add_column :item_stats, :description, :text
    add_column :item_stats, :skill, :string
    add_column :item_stats, :skill_id, :integer
    
  end
end
