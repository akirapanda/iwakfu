class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.integer :no
      t.string :chinese_name
      t.string :english_name
      t.boolean :visiable
      t.text :note
      t.string :cate_name
    end
    
    add_column :items, :item_set_id,:integer
  end
end
