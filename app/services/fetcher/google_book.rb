# frozen_string_literal: true

class Fetcher::GoogleBook

  class BookObject
    include Virtus.model

    attribute :api_id, Integer
    attribute :authors, String
    attribute :image, String
    attribute :title, String
    attribute :description, String
    attribute :published_at, DateTime
  end

  class BookSearch < BaseService
    initialize_with :keyword

    is_callable

    def call
      base_url = "https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=JP&maxResults=40"
      res =  JSON.parse(Net::HTTP.get(URI.parse(Addressable::URI.encode(base_url))))
      items = res["items"]
      return [] unless items
      
      items.map do |item|
        BookObject.new(
          api_id: item["id"],
          authors: item["volumeInfo"]["authors"] || ["Author Unknown"],
          image: thumbnail_url(item) || "common/no-image-icon.svg",
          title: item["volumeInfo"]["title"] || "No Title Available",
          description: item["volumeInfo"]["description"] || "No Description Available",
          published_at: item["volumeInfo"]["publishedDate"]
        )
      end
    end
  end

  class BookIdentify < BaseService
    initialize_with :api_id

    is_callable

    def call
      base_url = "https://www.googleapis.com/books/v1/volumes/#{api_id}"
      item = JSON.parse(Net::HTTP.get(URI.parse(Addressable::URI.encode(base_url))))
      return nil if item.has_key?("error")
      logger = Logger.new('log/development.log')
      logger.debug(item)
      item = BookObject.new(
        api_id: item["id"],
        authors: item["volumeInfo"]["authors"] || ["Author Unknown"],
        image: thumbnail_url(item) || "common/no-image-icon.svg",
        title: item["volumeInfo"]["title"] || "No Title Available",
        description: item["volumeInfo"]["description"] || "No Description Available",
        published_at: item["volumeInfo"]["publishedDate"]
      )
    end
  end
end
