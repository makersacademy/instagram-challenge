require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Metalshot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.paperclip_defaults = {
      storage: :s3,
      s3_storage_class: :REDUCED_REDUNDANCY,
      s3_region: "eu-west-2",
      s3_protocol: "https",
      url: ":s3_domain_url",
      path: "#{Rails.env}/:id/:basename.:style.:extension",
      s3_credentials: {
        bucket: ENV["BUCKET_NAME"],
        access_key_id: ENV["ACCESS_KEY_ID"],
        secret_access_key: ENV["SECRET_ACCESS_KEY"],
      }
    }
  end
end
