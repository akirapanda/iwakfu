# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140313055106) do

  create_table "drop_items", force: true do |t|
    t.integer "mob_id"
    t.integer "item_id"
    t.decimal "rate",    precision: 10, scale: 2, default: 0.0
    t.integer "lock",                             default: 0
  end

  create_table "item_set_stats", force: true do |t|
    t.integer "piece"
    t.text    "description"
    t.string  "skill"
    t.integer "skill_id"
    t.string  "cate"
    t.string  "stat_type"
    t.string  "content"
    t.decimal "value",       precision: 10, scale: 2, default: 0.0
    t.boolean "percent",                              default: false
    t.boolean "air",                                  default: false
    t.boolean "earth",                                default: false
    t.boolean "water",                                default: false
    t.boolean "fire",                                 default: false
    t.boolean "visiable",                             default: true
    t.integer "item_set_id"
  end

  create_table "item_sets", force: true do |t|
    t.string  "english_name"
    t.string  "chinese_name"
    t.integer "no"
    t.integer "level"
    t.integer "piece"
  end

  create_table "item_stats", force: true do |t|
    t.integer "item_id"
    t.string  "cate"
    t.string  "stat_type"
    t.string  "content"
    t.decimal "value",       precision: 10, scale: 2, default: 0.0
    t.boolean "percent",                              default: false
    t.boolean "air",                                  default: false
    t.boolean "earth",                                default: false
    t.boolean "water",                                default: false
    t.boolean "fire",                                 default: false
    t.text    "description"
    t.string  "skill"
    t.integer "skill_id"
  end

  create_table "item_types", force: true do |t|
    t.integer "no"
    t.string  "chinese_name"
    t.string  "english_name"
    t.boolean "visiable"
    t.text    "note"
    t.string  "cate_name"
  end

  create_table "items", force: true do |t|
    t.string   "icon"
    t.string   "name"
    t.integer  "no"
    t.string   "slot"
    t.integer  "item_type_id"
    t.string   "item_type"
    t.text     "content"
    t.text     "info"
    t.integer  "level"
    t.string   "quanlity"
    t.integer  "action_point"
    t.integer  "move_point"
    t.integer  "will_point"
    t.integer  "min_range"
    t.integer  "max_range"
    t.boolean  "hidden",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_set_id"
  end

  create_table "mob_families", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "no"
    t.string   "thumb"
  end

  create_table "mobs", force: true do |t|
    t.string   "icon"
    t.string   "name"
    t.integer  "mob_family_id"
    t.integer  "hp"
    t.integer  "mp"
    t.integer  "wp"
    t.integer  "ap"
    t.integer  "init"
    t.integer  "lock"
    t.integer  "dodge"
    t.integer  "block"
    t.integer  "crit"
    t.integer  "earth_resist"
    t.integer  "fire_resist"
    t.integer  "water_resist"
    t.integer  "air_resist"
    t.integer  "earth_damage"
    t.integer  "fire_damage"
    t.integer  "water_damage"
    t.integer  "air_damage"
    t.boolean  "capture_flag",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "no"
    t.string   "thumb"
    t.integer  "level"
  end

end
