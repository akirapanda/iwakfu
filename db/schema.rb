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

ActiveRecord::Schema.define(version: 20140315172426) do

  create_table "drop_items", force: true do |t|
    t.integer "mob_id"
    t.integer "item_id"
    t.decimal "rate",    precision: 10, scale: 2, default: 0.0
    t.integer "lock",                             default: 0
  end

  create_table "item_build_bonus_items", force: true do |t|
    t.integer  "item_build_id"
    t.integer  "item_set_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_builds", force: true do |t|
    t.string   "name"
    t.boolean  "publish",       default: false
    t.integer  "header_id"
    t.integer  "shoulder_id"
    t.integer  "neck_id"
    t.integer  "left_ring_id"
    t.integer  "right_ring_id"
    t.integer  "body_id"
    t.string   "author"
    t.integer  "foot_id"
    t.integer  "cloak_id"
    t.integer  "belt_id"
    t.integer  "left_hand_id"
    t.integer  "right_hand_id"
    t.integer  "pet_id"
    t.integer  "medal_id"
    t.integer  "user_id"
    t.boolean  "hidden",        default: true
    t.integer  "hp",            default: 0
    t.integer  "ap",            default: 0
    t.integer  "mp",            default: 0
    t.integer  "wp",            default: 0
    t.integer  "initiative",    default: 0
    t.integer  "dodge",         default: 0
    t.integer  "lock",          default: 0
    t.integer  "backstab",      default: 0
    t.integer  "critical",      default: 0
    t.integer  "block",         default: 0
    t.integer  "control",       default: 0
    t.integer  "cmc",           default: 0
    t.integer  "will_power",    default: 0
    t.integer  "prospecting",   default: 0
    t.integer  "perception",    default: 0
    t.integer  "heals",         default: 0
    t.integer  "wisdom",        default: 0
    t.integer  "range",         default: 0
    t.integer  "remove_ap",     default: 0
    t.integer  "fire_damage",   default: 0
    t.integer  "earth_damage",  default: 0
    t.integer  "water_damage",  default: 0
    t.integer  "air_damage",    default: 0
    t.integer  "fire_resist",   default: 0
    t.integer  "earth_resist",  default: 0
    t.integer  "water_resist",  default: 0
    t.integer  "air_resist",    default: 0
    t.integer  "fire_skill",    default: 0
    t.integer  "earth_skill",   default: 0
    t.integer  "water_skill",   default: 0
    t.integer  "air_skill",     default: 0
    t.integer  "fire",          default: 0
    t.integer  "water",         default: 0
    t.integer  "earth",         default: 0
    t.integer  "air",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "crit_fail"
    t.integer  "crit_damage"
  end

  create_table "item_details", force: true do |t|
    t.integer  "item_id"
    t.integer  "hp"
    t.integer  "ap"
    t.integer  "mp"
    t.integer  "wp"
    t.integer  "initiative"
    t.integer  "dodge"
    t.integer  "lock"
    t.integer  "backstab"
    t.integer  "critical"
    t.integer  "block"
    t.integer  "control"
    t.integer  "cmc"
    t.integer  "will_power"
    t.integer  "prospecting"
    t.integer  "perception"
    t.integer  "heals"
    t.integer  "wisdom"
    t.integer  "range"
    t.integer  "remove_ap"
    t.integer  "fire_damage"
    t.integer  "earth_damage"
    t.integer  "water_damage"
    t.integer  "air_damage"
    t.integer  "fire_resist"
    t.integer  "earth_resist"
    t.integer  "water_resist"
    t.integer  "air_resist"
    t.integer  "fire_skill"
    t.integer  "earth_skill"
    t.integer  "water_skill"
    t.integer  "air_skill"
    t.integer  "fire"
    t.integer  "water"
    t.integer  "earth"
    t.integer  "air"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crit_damage"
    t.integer  "crit_fail"
  end

  create_table "item_set_details", force: true do |t|
    t.integer  "item_set_id"
    t.integer  "piece"
    t.integer  "hp",           default: 0
    t.integer  "ap",           default: 0
    t.integer  "mp",           default: 0
    t.integer  "wp",           default: 0
    t.integer  "initiative",   default: 0
    t.integer  "dodge",        default: 0
    t.integer  "lock",         default: 0
    t.integer  "backstab",     default: 0
    t.integer  "critical",     default: 0
    t.integer  "block",        default: 0
    t.integer  "control",      default: 0
    t.integer  "cmc",          default: 0
    t.integer  "will_power",   default: 0
    t.integer  "prospecting",  default: 0
    t.integer  "perception",   default: 0
    t.integer  "heals",        default: 0
    t.integer  "wisdom",       default: 0
    t.integer  "range",        default: 0
    t.integer  "remove_ap",    default: 0
    t.integer  "fire_damage",  default: 0
    t.integer  "earth_damage", default: 0
    t.integer  "water_damage", default: 0
    t.integer  "air_damage",   default: 0
    t.integer  "fire_resist",  default: 0
    t.integer  "earth_resist", default: 0
    t.integer  "water_resist", default: 0
    t.integer  "air_resist",   default: 0
    t.integer  "fire_skill",   default: 0
    t.integer  "earth_skill",  default: 0
    t.integer  "water_skill",  default: 0
    t.integer  "air_skill",    default: 0
    t.integer  "fire",         default: 0
    t.integer  "water",        default: 0
    t.integer  "earth",        default: 0
    t.integer  "air",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crit_damage",  default: 0
    t.integer  "crit_fail",    default: 0
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
    t.boolean  "hidden",        default: false
  end

  create_table "recipe_items", force: true do |t|
    t.integer "item_id"
    t.integer "recipe_id"
    t.integer "quantity"
    t.string  "skill"
  end

  create_table "recipes", force: true do |t|
    t.integer "item_id"
    t.string  "name"
    t.string  "skill"
    t.integer "level"
    t.integer "quantity"
  end

  create_table "trapper_items", force: true do |t|
    t.integer "mob_id"
    t.integer "item_id"
    t.integer "level"
    t.string  "skill"
    t.string  "source"
  end

end
