# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_17_104239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.integer "show"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_enquiries_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "show_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "enquiries", "users"
  add_foreign_key "favourites", "users"
  add_foreign_key "suggestions", "users"
end
