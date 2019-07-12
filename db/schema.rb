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

ActiveRecord::Schema.define(version: 2019_07_12_150550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "qb_coas", force: :cascade do |t|
    t.string "qb_list_id"
    t.string "edit_sequence"
    t.string "name"
    t.string "full_name"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active"
  end

  create_table "qbwc_jobs", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "company", limit: 1000
    t.string "worker_class", limit: 100
    t.boolean "enabled", default: false, null: false
    t.text "request_index"
    t.text "requests"
    t.boolean "requests_provided_when_job_added", default: false, null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company"], name: "index_qbwc_jobs_on_company"
    t.index ["name"], name: "index_qbwc_jobs_on_name", unique: true
  end

  create_table "qbwc_sessions", id: :serial, force: :cascade do |t|
    t.string "ticket"
    t.string "user"
    t.string "company", limit: 1000
    t.integer "progress", default: 0, null: false
    t.string "current_job"
    t.string "iterator_id"
    t.string "error", limit: 1000
    t.text "pending_jobs", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "articles"
end
