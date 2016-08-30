# application
require File.expand_path('../boot', __FILE__)

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

HOSTNAME = ENV['HOSTNAME']

module InstagramChallenge
  # class Aplication
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.paperclip_defaults = {
                                  storage: :s3,
                                  s3_region: ENV['AWS_REGION'],
                                  s3_credentials: {
                                                    bucket: ENV['AWS_BUCKET'],
                                                    access_key_id: ENV['AWS_KEY'],
                                                    secret_access_key: ENV['AWS_SECRET'],
                                                    path_style: true
                                  }
    }
  end
end
