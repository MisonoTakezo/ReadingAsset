# frozen_string_literal: true

class Fetcher::GoogleBook

  class BookObject
    include Virtus.model

    attribute :api_id, Integer
    attribute :authors, String
    attribute :image, String
    attribute :title, String
    attribute :published_at, DateTime
  end

  class BookIndex < BaseService
    initialize_with :keyword

    is_callable

    def call
      base_url = "https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=JP"
      res =  JSON.parse(Net::HTTP.get(URI.parse(Addressable::URI.encode(base_url))))
      items = res["items"]
      return [] unless items
      
      items.map do |item|
        BookObject.new(
          api_id: item["id"],
          authors: item["volumeInfo"]["authors"],
          image: thumbnail_url(item),
          title: item["volumeInfo"]["title"],
          published_at: item["volumeInfo"]["publishedDate"]
        )
      end
    end
      
    private
      def thumbnail_url(item)
        item["volumeInfo"]["imageLinks"]["smallThumbnail"] if item["volumeInfo"]["imageLinks"].present?
      end
  end
end
