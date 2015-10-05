ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'factory_girl_rails'
require 'support/helpers.rb'
require 'support/database_cleaner'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

options = {js_errors: false}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.include FactoryGirl::Syntax::Methods
  config.include FeatureHelpers
  config.infer_spec_type_from_file_location!

end
