# frozen_string_literal: true

class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attr_accessor :google_books_api_id,
                :title,
                :image,
                :description,
                :published_at,
                :authors,
                :impression,
                :user_id

  attr_reader :post

  attribute :google_books_api_id, :string
  attribute :title, :string
  attribute :image, :string
  attribute :description
  attribute :published_at, :date
  attribute :authors
  attribute :user_id, :string
  attribute :impression, :string

  validates :google_books_api_id, presence: true
  validates :title, presence: true

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      book = find_book_or_nil(google_books_api_id)

      unless book.present?
        book = Book.new(
          google_books_api_id: google_books_api_id,
          title: title,
          image: image,
          description: description,
          published_at: published_at
        )
        book.save!
      end

      author_arr = authors_arr(authors)

      author_arr.each do |author_name|
        author = find_author_or_nil(author_name)

        unless author.present?
          author = Author.new(
            name: author_name
          )
          author.save!
        end

        books_author = find_books_author_or_nil(author.id, book.id)

        unless books_author.present?
          books_author = BooksAuthor.new(
            author_id: author.id,
            book_id: book.id
          )
          books_author.save!
        end
      end

      @post = find_post_or_nil(user_id, book.id)
      unless @post.present?
        @post = Post.new(
          user_id: user_id,
          book_id: book.id,
          impression: impression
        )
        @post.save!
      else
        @post.update!(impression: impression)
      end
    end

    true
  end

  private

    def authors_arr(authors)
      authors.split(" ")
    end

    def find_book_or_nil(book_api)
      book = Book.find_by(google_books_api_id: book_api)
      return book
    end

    def find_author_or_nil(name)
      author = Author.find_by(name: name)
      return author
    end

    def find_books_author_or_nil(author_id, book_id)
      books_author = BooksAuthor.find_by(author_id: author_id, book_id: book_id)
      return books_author
    end

    def find_post_or_nil(user_id, book_id)
      post = Post.find_by(user_id: user_id, book_id: book_id)
      return post
    end
end
