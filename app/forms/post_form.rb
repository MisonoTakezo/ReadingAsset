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
  validates :impression, length: { maximum: 500 }

  def save
    user = User.find_by(id: user_id, status: :verified)
    return false if invalid? || user.nil?

    ActiveRecord::Base.transaction do
      book = find_book_or_nil(google_books_api_id)

      if book.nil?
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

        if author.nil?
          author = Author.new(
            name: author_name
          )
          author.save!
        end

        books_author = find_books_author_or_nil(author, book)

        if books_author.nil?
          books_author = BooksAuthor.new(
            author: author,
            book: book
          )
          books_author.save!
        end
      end

      @post = find_post_or_nil(user, book)
      if @post.nil?
        @post = Post.new(
          user_id: user_id,
          book_id: book.id,
          impression: impression
        )
        @post.save!
      else
        @post.update!(status: :visible, impression: impression)
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

    def find_books_author_or_nil(author, book)
      books_author = BooksAuthor.find_by(author: author, book_id: book)
      return books_author
    end

    def find_post_or_nil(user, book)
      post = Post.find_by(user: user, book: book)
      return post
    end
end
