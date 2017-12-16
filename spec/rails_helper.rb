require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'factory_bot_rails'

config.include Devise::Test::IntegrationHelpers, type: :feature
config.include FactoryBot::Syntax::Methods
Capybara.javascript_driver = :poltergeist
Capybara.server = :puma


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

 config.after(:each) do
   DatabaseCleaner.clean
 end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end
