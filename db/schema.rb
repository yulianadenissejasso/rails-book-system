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

ActiveRecord::Schema[7.0].define(version: 2023_05_06_232542) do
  create_table "book_suggestions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "pending_approval"
    t.string "suggested_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pending"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.boolean "read"
    t.boolean "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suggested_by"
    t.boolean "pending_approval"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.string "encrypted_password"
    t.datetime "remember_created_at"
  end

end
