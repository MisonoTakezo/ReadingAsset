
# frozen_string_literal: true

class BaseService
  extend SmartInit
  
  def thumbnail_url(item)
    item["volumeInfo"]["imageLinks"]["smallThumbnail"] if item["volumeInfo"]["imageLinks"].present?
  end
end
