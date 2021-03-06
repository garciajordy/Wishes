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

ActiveRecord::Schema.define(version: 2021_04_22_053512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_wishes", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["group_id"], name: "index_group_wishes_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.string "icon", default: "https://bitsofco.de/content/images/2018/12/broken-1.png"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "wishlist_id", null: false
    t.boolean "paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
    t.index ["wishlist_id"], name: "index_payments_on_wishlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "group_id"
    t.index ["author_id"], name: "index_wishlists_on_author_id"
  end

  add_foreign_key "group_wishes", "groups"
  add_foreign_key "groups", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "payments", "wishlists"
  add_foreign_key "wishlists", "users", column: "author_id"
end
