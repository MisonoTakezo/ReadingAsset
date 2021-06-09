class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :google_books_api_id, null: false
      t.string :title, null: false
      t.string :image
      t.date :published_at

      t.timestamps
    end
  end
end