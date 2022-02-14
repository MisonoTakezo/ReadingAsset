# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@reading-asset.cf"
  layout "mailer"
end
