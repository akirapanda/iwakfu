class AddHandIntoItems < ActiveRecord::Migration
  def change
    add_column :items, :main_hand,:boolean
    add_column :items, :second_hand,:boolean
    add_column :items, :double_hand,:boolean
  end
end
