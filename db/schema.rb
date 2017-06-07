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

ActiveRecord::Schema.define(version: 20170606181359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "births", force: :cascade do |t|
    t.integer  "boys"
    t.integer  "girls"
    t.integer  "in_marriage"
    t.integer  "year"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "town_id"
    t.index ["town_id"], name: "index_births_on_town_id", using: :btree
  end

  create_table "cantons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "county_id"
    t.index ["county_id"], name: "index_cantons_on_county_id", using: :btree
  end

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deaths", force: :cascade do |t|
    t.integer  "male"
    t.integer  "female"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "town_id"
    t.index ["town_id"], name: "index_deaths_on_town_id", using: :btree
  end

  create_table "divorces", force: :cascade do |t|
    t.integer  "number"
    t.integer  "male_petition"
    t.integer  "female_petition"
    t.integer  "divorces_number"
    t.float    "male_average_age"
    t.float    "female_average_age"
    t.float    "average_duration"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "town_id"
    t.integer  "year"
    t.index ["town_id"], name: "index_divorces_on_town_id", using: :btree
  end

  create_table "marriages", force: :cascade do |t|
    t.integer  "male_home_number"
    t.integer  "male_home_first_number"
    t.float    "male_home_avg_age"
    t.integer  "female_home_number"
    t.integer  "female_home_first_number"
    t.float    "female_home_avg_age"
    t.integer  "year"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "town_id"
    t.index ["town_id"], name: "index_marriages_on_town_id", using: :btree
  end

  create_table "migrations", force: :cascade do |t|
    t.integer  "male_imigrants"
    t.integer  "female_imigrants"
    t.integer  "sr_imigrants"
    t.integer  "foreign_imigrants"
    t.integer  "male_emigrants"
    t.integer  "female_emigrants"
    t.integer  "sr_emigrants"
    t.integer  "year"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "town_id"
    t.integer  "foreign_emigrants"
    t.index ["town_id"], name: "index_migrations_on_town_id", using: :btree
  end

  create_table "towns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "births", "towns"
  add_foreign_key "cantons", "counties"
  add_foreign_key "deaths", "towns"
  add_foreign_key "divorces", "towns"
  add_foreign_key "marriages", "towns"
  add_foreign_key "migrations", "towns"
end
