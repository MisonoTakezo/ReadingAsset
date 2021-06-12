# frozen_string_literal: true

class InitTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :status, unsigned: true, limit: 1, null: false, default: 0, comment: "ステータス 0:invisible, 1: visible, 2:deleted"
      t.string :name, limit: 100, null: false, comment: '名前'
      t.string :email, limit: 100, null: false, unique: true, comment: 'メールアドレス'
      t.text :bio, comment: '自己紹介'
      t.string :password_digest, null: false, comment: 'パスワードハッシュ値'
      t.string :password_reset_token, comment: "パスワード再設定トークン"
      t.datetime :password_reset_token_expired_at, comment: "パスワード再設定トークン有効期限"
      t.string :profile_image, comment: "プロフィール画像"
      t.string :verification_token, comment: "有効化トークン"
      t.datetime :verification_token_expired_at, comment: "有効化トークン有効期限"

      t.timestamps
    end

    create_table :user_remembers do |t|
      t.references :user, foreign_key: true
      t.string "token_digest", limit: 1000, null: false, comment: "トークンハッシュ"

      t.timestamps
    end

    create_table :books do |t|
      t.string :google_books_api_id, limit: 1000, null: false, comment: "GoogleBooksAPI ID"
      t.string :title, limit: 100, null: false, comment: "タイトル"
      t.string :image,  limit: 1000, comment: "画像URL"
      t.text :description, limit: 1000, comment: "説明"
      t.date :published_at, comment: "出版日"

      t.timestamps
    end

    create_table :authors do |t|
      t.string :name, limit: 100, null: false, comment: "著者名"

      t.timestamps
    end

    create_table :books_authors do |t|
      t.references :author, foreign_key: true
      t.references :book, foreign_key: true
    end

    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :status, unsigned: true, limit: 1, null: false, default: 1, comment: "ステータス 0: unverified, 1: verified, 2: deleted"
      t.text :impression, comment: "感想"

      t.timestamps
    end
  end
end
