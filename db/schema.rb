# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170408062608) do

  create_table "answer_downvotes", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answer_downvotes", ["answer_id"], name: "index_answer_downvotes_on_answer_id"
  add_index "answer_downvotes", ["user_id"], name: "index_answer_downvotes_on_user_id"

  create_table "answer_upvotes", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answer_upvotes", ["answer_id"], name: "index_answer_upvotes_on_answer_id"
  add_index "answer_upvotes", ["user_id"], name: "index_answer_upvotes_on_user_id"

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "content"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "follow_mappings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follow_mappings", ["followee_id"], name: "index_follow_mappings_on_followee_id"
  add_index "follow_mappings", ["follower_id"], name: "index_follow_mappings_on_follower_id"

  create_table "question_downvotes", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_downvotes", ["question_id"], name: "index_question_downvotes_on_question_id"
  add_index "question_downvotes", ["user_id"], name: "index_question_downvotes_on_user_id"

  create_table "question_followers_mappings", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_followers_mappings", ["question_id"], name: "index_question_followers_mappings_on_question_id"
  add_index "question_followers_mappings", ["user_id"], name: "index_question_followers_mappings_on_user_id"

  create_table "question_upvotes", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_upvotes", ["question_id"], name: "index_question_upvotes_on_question_id"
  add_index "question_upvotes", ["user_id"], name: "index_question_upvotes_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string   "questions"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "upvotes", ["answer_id"], name: "index_upvotes_on_answer_id"
  add_index "upvotes", ["question_id"], name: "index_upvotes_on_question_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
