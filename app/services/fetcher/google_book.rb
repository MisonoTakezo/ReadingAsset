# frozen_string_literal: true

class Fetcher::GoogleBook

  class BookObject
    include Virtus.model

    attribute :google_books_api_id, String
    attribute :authors, String
    attribute :image, String
    attribute :title, String
    attribute :description, String
    attribute :published_at, DateTime
  end

  class BaseBook < BaseService
    def thumbnail_url(item)
      item["volumeInfo"]["imageLinks"]["smallThumbnail"] if item["volumeInfo"]["imageLinks"].present?
    end

    def sanitize_text(item)
      ActionView::Base.full_sanitizer.sanitize(item)
    end
  end

  class BookSearch < BaseBook
    initialize_with :q

    is_callable

    def call
      base_url = "https://www.googleapis.com/books/v1/volumes?q=#{q}&country=JP&maxResults=40"
      res =  JSON.parse(Net::HTTP.get(URI.parse(Addressable::URI.encode(base_url))))
      items = res["items"]
      return [] unless items
      
      items.map do |item|
        BookObject.new(
          google_books_api_id: item["id"],
          authors: item["volumeInfo"]["authors"] || ["AuthorUnknown"],
          image: thumbnail_url(item) || "common/no-image-icon.svg",
          title: item["volumeInfo"]["title"] || "No Title Available",
          description: sanitize_text(item["volumeInfo"]["description"]|| "No Description Available",).slice(0, 255),
          published_at: item["volumeInfo"]["publishedDate"]
        )
      end
    end
  end

  class BookIdentify < BaseBook
    initialize_with :google_books_api_id

    is_callable

    def call
      base_url = "https://www.googleapis.com/books/v1/volumes/#{google_books_api_id}"
      item = JSON.parse(Net::HTTP.get(URI.parse(Addressable::URI.encode(base_url))))
      return nil if item.has_key?("error")

      item = BookObject.new(
        google_books_api_id: item["id"],
        authors: item["volumeInfo"]["authors"] || ["AuthorUnknown"],
        image: thumbnail_url(item) || "common/no-image-icon.svg",
        title: item["volumeInfo"]["title"] || "No Title Available",
        description: sanitize_text(item["volumeInfo"]["description"]|| "No Description Available",).slice(0, 255),
        published_at: item["volumeInfo"]["publishedDate"]
      )
    end
  end
end
