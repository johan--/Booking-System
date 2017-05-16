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

ActiveRecord::Schema.define(version: 20170516230529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campground_id"
    t.string "key", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_api_keys_on_campground_id"
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "booking_has_people", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_has_people_on_booking_id"
    t.index ["person_id"], name: "index_booking_has_people_on_person_id"
  end

  create_table "booking_has_rentals", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_has_rentals_on_booking_id"
    t.index ["rental_id"], name: "index_booking_has_rentals_on_rental_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "campground_id"
    t.bigint "buyer_id"
    t.string "status", default: "created"
    t.date "arrival_date", null: false
    t.date "departure_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_bookings_on_buyer_id"
    t.index ["campground_id"], name: "index_bookings_on_campground_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "title", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "address", null: false
    t.string "zip_code", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.string "phone_number", null: false
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campgrounds", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "zip_code", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.string "logo_url"
    t.string "website_url"
    t.string "phone_number"
    t.string "mobile_number"
    t.string "currency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "booking_id"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "people", force: :cascade do |t|
    t.bigint "buyer_id"
    t.date "birth_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_people_on_buyer_id"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "season_id"
    t.bigint "rental_category_id"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_category_id"], name: "index_prices_on_rental_category_id"
    t.index ["season_id"], name: "index_prices_on_season_id"
  end

  create_table "rental_categories", force: :cascade do |t|
    t.bigint "campground_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_rental_categories_on_campground_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "rental_category_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_category_id"], name: "index_rentals_on_rental_category_id"
  end

  create_table "rights", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campground_id"
    t.string "can_view_bookings", default: "t"
    t.string "can_edit_bookings", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_rights_on_campground_id"
    t.index ["user_id"], name: "index_rights_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "campground_id"
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_seasons_on_campground_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "api_keys", "campgrounds"
  add_foreign_key "api_keys", "users"
  add_foreign_key "booking_has_people", "bookings"
  add_foreign_key "booking_has_people", "people"
  add_foreign_key "booking_has_rentals", "bookings"
  add_foreign_key "booking_has_rentals", "rentals"
  add_foreign_key "bookings", "buyers"
  add_foreign_key "bookings", "campgrounds"
  add_foreign_key "payments", "bookings"
  add_foreign_key "people", "buyers"
  add_foreign_key "prices", "rental_categories"
  add_foreign_key "prices", "seasons"
  add_foreign_key "rental_categories", "campgrounds"
  add_foreign_key "rentals", "rental_categories"
  add_foreign_key "rights", "campgrounds"
  add_foreign_key "rights", "users"
  add_foreign_key "seasons", "campgrounds"
end