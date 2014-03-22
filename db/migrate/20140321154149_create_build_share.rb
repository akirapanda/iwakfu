class CreateBuildShare < ActiveRecord::Migration
  def change
    create_table :build_shares do |t|
      t.integer :item_build_id
      t.string :name
      t.string :author
      t.string :edit_token
      
      t.text :content
      t.boolean :fire
      t.boolean :air
      t.boolean :water
      t.boolean :earth
      
      t.boolean :dps
      t.boolean :tank
      t.boolean :heal
      t.boolean :ect
      
      t.boolean :qishi
      t.boolean :kuangzhan
      t.boolean :zhiliao
      t.boolean :zhaohuan
      t.boolean :zhiwu
      t.boolean :xiongmao
      t.boolean :gongjian
      t.boolean :cike
      t.boolean :shijian
      t.boolean :baozang
      t.boolean :luckycat
      
      t.integer :min_level
      t.integer :max_level
      t.timestamps
    end
    
    add_column :item_builds, :min_level,:integer,:default=>140
    add_column :item_builds, :max_level,:integer,:default=>0
    
  end
end
