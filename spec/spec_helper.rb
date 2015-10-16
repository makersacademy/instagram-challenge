require 'factory_girl_rails'
require_relative 'helpers/factory_helper'

RSpec.configure do |config|

  config.include FactoryHelper
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
end
