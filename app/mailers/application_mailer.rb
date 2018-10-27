# frozen_string_literal: true

# Does the mailing.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
