ENV['RAILS_ENV'] ||= 'test'

require 'aws'
AWS.stub!
AWS.config(:access_key_id => "TESTKEY", :secret_access_key => "TESTSECRET", :stub_requests => true)

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
require 'support/database_cleaner'

require_relative 'helpers/sign_up_helper'
require_relative 'support/factory_girl'
require_relative 'helpers/sign_in_helper'
require_relative 'helpers/photo_upload_helper'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end
