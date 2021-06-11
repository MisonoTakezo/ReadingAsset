# frozen_string_literal: true

class PostForm
  include ActiveModel::Model

  attr_accessor :impression

  attribute :book
  attribute :user_id, :string
  attribute :impression, :string

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do

      @book = find_book_or_nil(book.google_books_api)

      unless @book.present?
        @book = Book.new(
          google_books_api: book.oogle_books_api,
          title: book.title,
          image: book.image,
          description: book.description,
          published_at: book.published_at
        )
        @book.save!
      
      book.authors.each do |author_name|
        @author = find_author_or_nil(author_name)

        unless @author.present?
          @author = Author.new(
            name: author_name
          )
          @author.save!

        @books_authors = find_books_authors_or_nil(@author.id, @book.id)

        unless @books_authors.present?
          @books_authors = BooksAuthors.new(
            author_id: @author.id,
            book_id: @book.id
          )
          @books_authors.save!
        end
      end

      @post = find_post_or_nil(user_id, @book.id)
      unless @author.present?
        @post = Post.new(
          user_id: user_id,
          book_id: @book.id,
          impression: impression
        )
        @post.save!
      else
        @post.update!(impression: impression)
      end
    end

    true
  end

  def find_book_or_nil(book_api)
    book = Book.find_by(google_books_api: book_api)
    return book
  end

  def find_author_or_nil(name)
    author = Author.find_by(name: name)
    return author
  end

  def find_books_authors_or_nil(author_id, book_id)
    books_authors = BooksAuthors.find_by(author_id: author_id, book_id: book_id)
    return books_authors
  end

  def find_post_or_nil(user_id, book_id)
    post = Post.find_by(user_id: user_id, book_id: book_id)
    return post
  end
end
