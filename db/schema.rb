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

ActiveRecord::Schema.define(version: 20170325002233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "births", force: :cascade do |t|
    t.integer  "year"
    t.integer  "mother_age"
    t.integer  "count"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "towns_id"
    t.index ["towns_id"], name: "index_births_on_towns_id", using: :btree
  end

  create_table "cantons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "counties_id"
    t.index ["counties_id"], name: "index_cantons_on_counties_id", using: :btree
  end

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deaths", force: :cascade do |t|
    t.integer  "year"
    t.integer  "age"
    t.integer  "count"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "towns_id"
    t.index ["towns_id"], name: "index_deaths_on_towns_id", using: :btree
  end

  create_table "divorces", force: :cascade do |t|
    t.integer  "year"
    t.integer  "women_age"
    t.integer  "man_age"
    t.integer  "count"
    t.integer  "duration"
    t.string   "gender_file_a_petition"
    t.text     "verdict"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "towns_id"
    t.index ["towns_id"], name: "index_divorces_on_towns_id", using: :btree
  end

  create_table "mariages", force: :cascade do |t|
    t.integer  "year"
    t.integer  "bride_age"
    t.integer  "fiance_age"
    t.integer  "count"
    t.text     "mariage_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "towns_id"
    t.index ["towns_id"], name: "index_mariages_on_towns_id", using: :btree
  end

  create_table "migrations", force: :cascade do |t|
    t.integer  "year"
    t.integer  "age"
    t.integer  "emigrants"
    t.integer  "imigrants"
    t.text     "reason"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "towns_id"
    t.index ["towns_id"], name: "index_migrations_on_towns_id", using: :btree
  end

  create_table "towns", force: :cascade do |t|
    t.string  "name"
    t.integer "citizens"
    t.integer "cantons_id"
    t.index ["cantons_id"], name: "index_towns_on_cantons_id", using: :btree
  end

  add_foreign_key "births", "towns", column: "towns_id"
  add_foreign_key "cantons", "counties", column: "counties_id", name: "cantons_counties_id_fk"
  add_foreign_key "deaths", "towns", column: "towns_id"
  add_foreign_key "divorces", "towns", column: "towns_id"
  add_foreign_key "mariages", "towns", column: "towns_id"
  add_foreign_key "migrations", "towns", column: "towns_id"
  add_foreign_key "towns", "cantons", column: "cantons_id", name: "towns_cantons_id_fk"
end
