# frozen_string_literal: true

class InitTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false, comment: '名前'
      t.string :email, limit: 100, null: false, unique: true, comment: 'メールアドレス'
      t.text :introduction, comment: '自己紹介'
      t.string :password_digest, null: false, comment: 'パスワードハッシュ値'
      t.string :password_reset_token, null: false, comment: "パスワード再設定トークン"
      t.datetime :password_reset_token_expired_at, comment: "パスワード再設定トークン有効期限"
      t.string :profile_image, comment: "プロフィール画像"
      t.string :activation_token, comment: "有効化トークン"
      t.datetime :activation_token_expired_at, comment: "有効化トークン有効期限"

      t.timestamps
    end

    create_table :user_remembers do |t|
      t.references :user
      t.string "token_digest", limit: 100, null: false, comment: "トークンハッシュ"

      t.timestamps
    end

    create_table :posts do |t|
      t.references :user
      t.integer :status, unsigned: true, limit: 1, null: false, default: 0, comment: 'ステータス'
      t.string :title, limit: 100, null: false, comment: 'タイトル'
      t.text :impression, comment: '感想'

      t.timestamps
    end
  end
end
