# == Schema Information
#
# Table name: books
#
#  id                                     :bigint           not null, primary key
#  google_books_api_id(GoogleBooksAPI ID) :string(100)      not null
#  title(タイトル)                        :string(100)      not null
#  image(画像URL)                         :string(255)
#  description(説明)                      :text(255)
#  published_at(出版日)                   :date
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#
class Book < ApplicationRecord

  belongs_to :post

  has_many :book, through: :books_authors
  has_many :books_authors

  validates :google_books_api_id, presence: true
  validates :title, length: { maximum: 50 }, presence: true
  validates :image, length: { maximum: 255 }
  validates :description, length: { maximum: 255 }
end
