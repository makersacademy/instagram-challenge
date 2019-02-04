# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'makergram.com'
  layout 'mailer'
end
