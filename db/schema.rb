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

ActiveRecord::Schema[7.0].define(version: 2022_05_21_164059) do
  create_table "carrier_prices", force: :cascade do |t|
    t.string "band_name"
    t.integer "min_volume"
    t.integer "max_volume"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "price"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_carrier_prices_on_carrier_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.string "domain_name"
    t.boolean "active_state", default: true
    t.string "registration_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "cpf"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_periods", force: :cascade do |t|
    t.string "band_name"
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "days"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_delivery_periods_on_carrier_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.date "quotation_date"
    t.date "delivery_date"
    t.integer "weight"
    t.integer "height"
    t.integer "width"
    t.integer "depth"
    t.integer "distance"
    t.integer "shipping_price"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_quotations_on_carrier_id"
  end

  create_table "vehicules", force: :cascade do |t|
    t.string "plate_number"
    t.string "brand_name"
    t.string "vehicle_model"
    t.string "year"
    t.integer "max_load"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_vehicules_on_carrier_id"
  end

  add_foreign_key "carrier_prices", "carriers"
  add_foreign_key "delivery_periods", "carriers"
  add_foreign_key "quotations", "carriers"
  add_foreign_key "vehicules", "carriers"
end
