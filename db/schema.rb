# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_14_111427) do

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "rpm"
    t.integer "max_rpm"
    t.integer "gear"
    t.integer "max_gear"
    t.integer "speed"
    t.integer "max_speed"
    t.integer "torque"
    t.integer "odo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "race_cars", force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_race_cars_on_car_id"
    t.index ["race_id", "car_id"], name: "index_race_cars_on_race_id_and_car_id", unique: true
    t.index ["race_id"], name: "index_race_cars_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "race_cars", "cars"
  add_foreign_key "race_cars", "races"
end
