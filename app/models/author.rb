# == Schema Information
#
# Table name: authors
#
#  id           :bigint           not null, primary key
#  name(著者名) :string(100)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Author < ApplicationRecord
  validates :name, length: { maximum: 50 }, presence: true
  
  has_many :books_authors
  has_many :books, through: :books_authors
end
