class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :google_books_api_id, limit: 100, null: false, comment: "GoogleBooksAPI ID"
      t.string :title, limit: 100, null: false, comment: "タイトル"
      t.string :image, comment: "画像URL"
      t.text :description, limit: 255, comment: "説明"
      t.date :published_at, comment: "出版日"

      t.timestamps
    end
  end
end
