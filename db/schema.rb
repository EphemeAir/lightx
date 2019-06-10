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

ActiveRecord::Schema.define(version: 2019_05_22_100412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string "yt_id"
    t.string "name"
    t.bigint "user_id"
    t.text "description"
    t.string "thumbnail_url"
    t.time "published_at"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_channels_on_user_id"
  end

  create_table "discipline_topics", force: :cascade do |t|
    t.bigint "discipline_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_discipline_topics_on_discipline_id"
    t.index ["topic_id"], name: "index_discipline_topics_on_topic_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.bigint "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_disciplines_on_grade_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_categories", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_topic_categories_on_category_id"
    t.index ["topic_id"], name: "index_topic_categories_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "wiki_name"
    t.boolean "wiki_analysed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "refresh_token"
    t.boolean "admin", default: false, null: false
    t.bigint "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["grade_id"], name: "index_users_on_grade_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_topics", force: :cascade do |t|
    t.bigint "video_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_video_topics_on_topic_id"
    t.index ["video_id"], name: "index_video_topics_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "yt_id"
    t.string "name"
    t.bigint "channel_id"
    t.text "description"
    t.string "thumbnail_url"
    t.integer "duration"
    t.boolean "captioned"
    t.text "captions"
    t.time "published_at"
    t.boolean "tagged"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_videos_on_channel_id"
  end

  add_foreign_key "discipline_topics", "disciplines"
  add_foreign_key "discipline_topics", "topics"
  add_foreign_key "disciplines", "grades"
  add_foreign_key "topic_categories", "categories"
  add_foreign_key "topic_categories", "topics"
  add_foreign_key "users", "grades"
  add_foreign_key "video_topics", "topics"
  add_foreign_key "video_topics", "videos"
  add_foreign_key "videos", "channels"
end
