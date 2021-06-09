
# frozen_string_literal: true

class BaseService
  extend SmartInit
  include Rails.application.routes.url_helpers
end
