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

ActiveRecord::Schema.define(version: 2019_09_09_180950) do

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.float "rating"
    t.string "content"
    t.integer "user_id"
    t.integer "sandwich_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "type_of"
    t.string "img_url", default: "banana.jpg"
    t.boolean "is_meat", default: false
    t.boolean "is_dairy_or_egg", default: false
    t.boolean "is_gluten_free", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "replies", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "comment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sandwich_ingredients", force: :cascade do |t|
    t.integer "sandwich_id"
    t.integer "ingredient_id"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sandwiches", force: :cascade do |t|
    t.string "title"
    t.string "instructions"
    t.string "description"
    t.string "img_url", default: "sandwich.jpg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "display_name"
    t.integer "age"
    t.string "bio"
    t.string "img_url", default: "splat.png"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
