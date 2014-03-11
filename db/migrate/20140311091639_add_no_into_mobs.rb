class AddNoIntoMobs < ActiveRecord::Migration
  def change
    add_column :mobs, :no,:string
    add_column :mobs, :thumb,:string
    add_column :mobs, :level,:integer
    add_column :mobs, :hidden,:boolean,:default => false
    
    add_column :mob_families, :no,:string
    add_column :mob_families, :thumb,:string
    
  end
end
