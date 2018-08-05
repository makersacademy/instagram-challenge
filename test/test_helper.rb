ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
require 'simplecov-console'
SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Console

require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
