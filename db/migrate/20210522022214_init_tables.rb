# frozen_string_literal: true

class InitTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false, comment: '名前'
      t.string :email, limit: 100, null: false, unique: true, comment: 'メールアドレス'
      t.text :introduction, null: false, comment: '自己紹介'
      t.string :password_digest, limit: 100, null: false, comment: 'パスワードハッシュ値'

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
