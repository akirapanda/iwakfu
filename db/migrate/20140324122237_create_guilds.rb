class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :name
      t.string :leader
      t.string :nation
      t.integer :number
      t.string :field_1
      t.string :field_2
      t.string :field_3
      t.string :field_4
      t.timestamps
    end
  end
end
