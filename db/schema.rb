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

ActiveRecord::Schema[7.0].define(version: 2022_05_29_185517) do
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

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.integer "weight"
    t.integer "height"
    t.integer "width"
    t.integer "depth"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_details", force: :cascade do |t|
    t.date "delivery_date"
    t.integer "shipping_price"
    t.integer "carrier_id", null: false
    t.integer "quotation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_quotation_details_on_carrier_id"
    t.index ["quotation_id"], name: "index_quotation_details_on_quotation_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.date "quotation_date"
    t.integer "weight"
    t.integer "height"
    t.integer "width"
    t.integer "depth"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "quotation_code"
  end

  create_table "service_orders", force: :cascade do |t|
    t.date "placed_date"
    t.string "tracking_id"
    t.integer "distance"
    t.integer "carrier_id", null: false
    t.integer "customer_id", null: false
    t.integer "warehouse_id", null: false
    t.integer "vehicule_id"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["carrier_id"], name: "index_service_orders_on_carrier_id"
    t.index ["customer_id"], name: "index_service_orders_on_customer_id"
    t.index ["product_id"], name: "index_service_orders_on_product_id"
    t.index ["vehicule_id"], name: "index_service_orders_on_vehicule_id"
    t.index ["warehouse_id"], name: "index_service_orders_on_warehouse_id"
  end

  create_table "track_orders", force: :cascade do |t|
    t.date "tracking_date"
    t.string "location"
    t.string "comments"
    t.integer "service_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_order_id"], name: "index_track_orders_on_service_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "carrier_id"
    t.index ["carrier_id"], name: "index_users_on_carrier_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carrier_prices", "carriers"
  add_foreign_key "delivery_periods", "carriers"
  add_foreign_key "quotation_details", "carriers"
  add_foreign_key "quotation_details", "quotations"
  add_foreign_key "service_orders", "carriers"
  add_foreign_key "service_orders", "customers"
  add_foreign_key "service_orders", "products"
  add_foreign_key "service_orders", "vehicules"
  add_foreign_key "service_orders", "warehouses"
  add_foreign_key "track_orders", "service_orders"
  add_foreign_key "users", "carriers"
  add_foreign_key "vehicules", "carriers"
end
