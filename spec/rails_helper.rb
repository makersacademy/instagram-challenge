# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require_relative 'web_helper'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, type: :feature) do
      # :rack_test driver's Rack app under test shares database connection
      # with the specs, so continue to use transaction strategy for speed.
      driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

      if !driver_shares_db_connection_with_specs
        # Driver is probably for an external browser with an app
        # under test that does *not* share a database connection with the
        # specs, so use truncation strategy.
        DatabaseCleaner.strategy = :truncation
      end
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.append_after(:each) do
      DatabaseCleaner.clean
    end
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

end
