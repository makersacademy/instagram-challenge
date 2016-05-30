ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

module AuthHelpers
  def log_in(user = {email: "amy@gmail.com", password: "testtest"})
    visit("/")
    fill_in("Email", with: user[:email])
    fill_in("Password", with: user[:password])
    click_button("Log in")
  end

  def sign_up(username = "myUsername")
    visit("/")
    click_link("Sign up", match: :first)
    fill_in("Username", with: username)
    fill_in("Email", with: "test@example.com")
    fill_in("Password", with: "testtest")
    fill_in("Password confirmation", with: "testtest")
    click_button("Sign up")
  end
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include AuthHelpers, type: :feature
  config.include FactoryGirl::Syntax::Methods
  
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
