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

ActiveRecord::Schema.define(version: 2020_06_01_095426) do

  create_table "tasks", force: :cascade do |t|
    t.text "task"
    t.date "limit_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "priority"
    t.integer "user_id"
    t.boolean "public", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "mail", limit: 191, null: false
    t.string "password_digest", limit: 191, null: false
    t.string "remember_token", limit: 191
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.integer "done_total"
  end

end
