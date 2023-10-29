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

ActiveRecord::Schema[7.0].define(version: 2023_10_27_094238) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudonym"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "lead"
    t.string "thumbnail"
    t.text "text_content"
    t.string "media"
    t.integer "mood_value"
    t.text "keywords"
    t.boolean "is_longformat"
    t.boolean "is_draft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "debate_responses", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "debate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debate_id"], name: "index_debate_responses_on_debate_id"
    t.index ["user_id"], name: "index_debate_responses_on_user_id"
  end

  create_table "debates", force: :cascade do |t|
    t.string "title"
    t.text "lead"
    t.text "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "results_visible"
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_debates_on_category_id"
  end

  create_table "favoris", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_favoris_on_article_id"
    t.index ["user_id"], name: "index_favoris_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id", null: false
    t.bigint "user_id", null: false
    t.index ["article_id"], name: "index_favorites_on_article_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "polls", force: :cascade do |t|
    t.text "question"
    t.string "label_1"
    t.integer "count_1"
    t.string "label_2"
    t.integer "count_2"
    t.string "label_3"
    t.integer "count_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "lead"
    t.bigint "debate_id", null: false
    t.index ["debate_id"], name: "index_polls_on_debate_id"
  end

  create_table "reads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_reads_on_article_id"
    t.index ["user_id"], name: "index_reads_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudonym"
    t.integer "consecutive_days"
    t.date "last_login_date"
    t.date "last_article_access_date"
    t.string "avatar"
    t.date "last_article_read_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "poll_id", null: false
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_votes_on_poll_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "debate_responses", "debates"
  add_foreign_key "debate_responses", "users"
  add_foreign_key "debates", "categories"
  add_foreign_key "favoris", "articles"
  add_foreign_key "favoris", "users"
  add_foreign_key "favorites", "articles"
  add_foreign_key "favorites", "users"
  add_foreign_key "polls", "debates"
  add_foreign_key "reads", "articles"
  add_foreign_key "reads", "users"
  add_foreign_key "votes", "polls"
  add_foreign_key "votes", "users"
end
