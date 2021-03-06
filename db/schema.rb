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

ActiveRecord::Schema.define(version: 2019_02_05_064200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.string "content", limit: 255, default: "", null: false
    t.boolean "correct", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", limit: 255, default: "", null: false
    t.string "description", limit: 255, default: "", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "lesson_questions", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_lesson_questions_on_answer_id"
    t.index ["lesson_id"], name: "index_lesson_questions_on_lesson_id"
    t.index ["question_id"], name: "index_lesson_questions_on_question_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_lessons_on_book_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "book_id"
    t.string "content", limit: 255, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_questions_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 255, default: "", null: false
    t.string "icon"
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "books", "users"
  add_foreign_key "lesson_questions", "answers"
  add_foreign_key "lesson_questions", "lessons"
  add_foreign_key "lesson_questions", "questions"
  add_foreign_key "lessons", "books"
  add_foreign_key "lessons", "users"
  add_foreign_key "questions", "books"
end
