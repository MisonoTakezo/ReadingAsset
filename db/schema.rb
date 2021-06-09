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

ActiveRecord::Schema.define(version: 2021_06_07_112015) do

  create_table "authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "book_id"
    t.string "name", null: false
    t.boolean "is_representative", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_authors_on_book_id"
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "google_books_api_id", null: false
    t.string "title", null: false
    t.string "image"
    t.date "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status", limit: 1, default: 1, null: false, comment: "ステータス 0: unverified, 1: verified, 2: deleted", unsigned: true
    t.string "title", limit: 100, null: false, comment: "タイトル"
    t.text "impression", comment: "感想"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_remembers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token_digest", limit: 100, null: false, comment: "トークンハッシュ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_remembers_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "status", limit: 1, default: 0, null: false, comment: "ステータス 0:invisible, 1: visible, 2:deleted", unsigned: true
    t.string "name", limit: 100, null: false, comment: "名前"
    t.string "email", limit: 100, null: false, comment: "メールアドレス"
    t.text "introduction", comment: "自己紹介"
    t.string "password_digest", null: false, comment: "パスワードハッシュ値"
    t.string "password_reset_token", comment: "パスワード再設定トークン"
    t.datetime "password_reset_token_expired_at", comment: "パスワード再設定トークン有効期限"
    t.string "profile_image", comment: "プロフィール画像"
    t.string "verification_token", comment: "有効化トークン"
    t.datetime "verification_token_expired_at", comment: "有効化トークン有効期限"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authors", "books"
end
