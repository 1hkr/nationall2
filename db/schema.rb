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

ActiveRecord::Schema.define(version: 20180306173410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "summary"
    t.text "content"
    t.string "picture"
    t.date "publishing_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.integer "avg_emotion"
    t.integer "avg_temperature"
    t.integer "avg_rating"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_prefs", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_prefs_on_category_id"
    t.index ["user_id"], name: "index_categories_prefs_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.integer "amount_cents", default: 0, null: false
    t.bigint "user_id"
    t.bigint "article_id"
    t.jsonb "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_donations_on_article_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "opinions", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_opinions_on_article_id"
    t.index ["user_id"], name: "index_opinions_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "emotion"
    t.integer "temperature"
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_reviews_on_article_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.text "bio"
    t.string "picture"
    t.integer "emotion_pref"
    t.integer "temperature_pref"
    t.string "badge"
    t.string "link"
    t.float "latitude"
    t.float "longitude"
    t.boolean "answered", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "categories_prefs", "categories"
  add_foreign_key "categories_prefs", "users"
  add_foreign_key "donations", "articles"
  add_foreign_key "donations", "users"
  add_foreign_key "opinions", "articles"
  add_foreign_key "opinions", "users"
  add_foreign_key "reviews", "articles"
  add_foreign_key "reviews", "users"
end
