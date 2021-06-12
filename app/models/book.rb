# == Schema Information
#
# Table name: books
#
#  id                                     :bigint           not null, primary key
#  google_books_api_id(GoogleBooksAPI ID) :string(1000)     not null
#  title(タイトル)                        :string(100)      not null
#  image(画像URL)                         :string(1000)
#  description(説明)                      :text(65535)
#  published_at(出版日)                   :date
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#
class Book < ApplicationRecord

  has_one :post

  has_many :books_authors
  has_many :authors, through: :books_authors

  validates :google_books_api_id, presence: true
  validates :title, length: { maximum: 50 }, presence: true
  validates :image, length: { maximum: 1000 }
  validates :description, length: { maximum: 1000 }
end
