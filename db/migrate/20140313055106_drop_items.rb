class DropItems < ActiveRecord::Migration
  def change
    create_table :drop_items do |t|
      t.integer :mob_id
      t.integer :item_id
      t.decimal :rate,:default=>0, :precision => 10, :scale => 2  
      t.integer :lock,:default=>0
      t.timestamp
    end
  end
end
