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

ActiveRecord::Schema[7.0].define(version: 2023_06_10_013229) do
  create_table "lessons", force: :cascade do |t|
    t.string "semester", null: false
    t.string "day", null: false
    t.string "time", null: false
    t.string "course", null: false
    t.string "title", null: false
    t.string "teacher", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "edited", default: "false", null: false
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.integer "user_id", null: false
    t.integer "lesson_id", null: false
    t.string "edited", default: "false", null: false
    t.index ["lesson_id"], name: "index_reviews_on_lesson_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "lessons", "users"
  add_foreign_key "reviews", "lessons"
  add_foreign_key "reviews", "users"
end
