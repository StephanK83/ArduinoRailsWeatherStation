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

ActiveRecord::Schema[7.0].define(version: 2023_09_29_121202) do
  create_table "current_measurements", force: :cascade do |t|
    t.float "temperature"
    t.float "humidity"
    t.float "pressure"
    t.float "wind_speed"
    t.string "wind_direction"
    t.float "rainfall"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_based_on_ip"
  end

  create_table "forecasts", force: :cascade do |t|
    t.float "max_temperature"
    t.float "min_temperature"
    t.float "avg_humidity"
    t.float "precipitation_probability"
    t.float "wind_speed"
    t.string "wind_direction"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wind_speed_bft"
  end

  create_table "ip_locations", force: :cascade do |t|
    t.string "ip"
    t.string "location"
    t.date "last_updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
