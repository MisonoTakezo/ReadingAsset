# frozen_string_literal: true

# == Schema Information
#
# Table name: books_authors
#
#  id        :bigint           not null, primary key
#  author_id :bigint
#  book_id   :bigint
#
# Indexes
#
#  index_books_authors_on_author_id  (author_id)
#  index_books_authors_on_book_id    (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (book_id => books.id)
#
class BooksAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author
end
