ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

require_relative './helpers/add_photo.rb'
require_relative './helpers/add_comment.rb'

require_relative './factories/comment.rb'
require_relative './factories/photo.rb'
require_relative './factories/user.rb'

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

require 'support/database_cleaner'


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  include Warden::Test::Helpers

  Warden.test_mode!
  
  config.include FactoryGirl::Syntax::Methods
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  
  config.use_transactional_fixtures = false
  
  config.infer_spec_type_from_file_location!
end
