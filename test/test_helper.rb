ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def sign_up
  click_link "Sign-up"
  fill_in "user[username]", with: "test_user"
  fill_in "user[email]", with: "test@test.com"
  fill_in "user[password]", with: "123"
  click_button "Create account"
end
