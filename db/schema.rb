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

ActiveRecord::Schema[8.1].define(version: 2026_08_04_050349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "first"
    t.bigint "listing_id"
    t.datetime "second"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "characteristics", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "parameter_id"
    t.index ["listing_id"], name: "index_characteristics_on_listing_id"
    t.index ["parameter_id"], name: "index_characteristics_on_parameter_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.bigint "listing_id"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["listing_id"], name: "index_comments_on_listing_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "listing_id"
    t.string "path"
    t.index ["listing_id"], name: "index_images_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "people"
    t.integer "price"
    t.float "rating"
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "listings"
  add_foreign_key "characteristics", "listings"
  add_foreign_key "characteristics", "parameters"
  add_foreign_key "comments", "listings"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "listings"
  add_foreign_key "listings", "users"
end
