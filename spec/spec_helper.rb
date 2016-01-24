require 'factory_girl_rails'
require "paperclip/matchers"
require_relative "helpers/web_helpers.rb"

include ActionDispatch::TestProcess


RSpec.configure do |config|

  config.include Paperclip::Shoulda::Matchers

  config.expose_dsl_globally = false

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end



end
