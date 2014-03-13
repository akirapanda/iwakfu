class TrapperItems < ActiveRecord::Migration
  def change
    create_table :trapper_items do |t|
      t.integer :mob_id
      t.integer :item_id
      t.integer :level
      t.string :source
      t.timestamp
    end
  end
end
