# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticate

  helper_method :current_user
  helper_method :login_required
  helper_method :logged_in?

  before_action :current_user
end
