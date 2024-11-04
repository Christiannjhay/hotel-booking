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

ActiveRecord::Schema[7.2].define(version: 2024_11_04_204733) do
  create_table "bookings", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "hotel_id", null: false
    t.integer "room_id", null: false
    t.string "customer_name"
    t.datetime "check_in_date"
    t.datetime "check_out_date"
    t.integer "number_of_guests"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.string "password_1"
    t.string "password_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "contact"
    t.string "description"
    t.json "amenities", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.integer "room_id", null: false
    t.integer "customer_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["hotel_id"], name: "index_reviews_on_hotel_id"
    t.index ["room_id"], name: "index_reviews_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.string "room_type"
    t.integer "max_persons"
    t.text "description"
    t.decimal "price"
    t.json "amenities", default: []
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "reviews", "customers"
  add_foreign_key "reviews", "hotels"
  add_foreign_key "reviews", "rooms"
  add_foreign_key "rooms", "hotels"
end
