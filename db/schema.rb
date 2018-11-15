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

ActiveRecord::Schema.define(version: 2018_11_15_161005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arenas", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "capacity"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_carts_on_friend_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "arena_id"
    t.bigint "friend_id"
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arena_id"], name: "index_fights_on_arena_id"
    t.index ["friend_id"], name: "index_fights_on_friend_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "rating"
    t.string "strength"
    t.string "agility"
    t.string "weight"
    t.string "height"
    t.string "nationality"
    t.bigint "user_id"
    t.string "slogan"
    t.integer "age"
    t.string "picture"
    t.integer "price"
    t.integer "wins"
    t.integer "losses"
    t.string "description"
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_friends_on_purchase_id"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "total_price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_reservations_on_friend_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "first_name"
    t.string "last_name"
    t.string "picture"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "friends"
  add_foreign_key "carts", "users"
  add_foreign_key "fights", "arenas"
  add_foreign_key "fights", "fights", column: "friend_id"
  add_foreign_key "friends", "purchases"
  add_foreign_key "friends", "users"
  add_foreign_key "purchases", "users"
  add_foreign_key "reservations", "friends"
  add_foreign_key "reservations", "users"
end
