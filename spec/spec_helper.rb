require 'rails_helper'
require 'coveralls'
require_relative './helpers/posts_helper_spec'
require_relative './helpers/users_helper_spec'
require 'shoulda-matchers'


Coveralls.wear!('rails')

RSpec.configure do |config|

  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end


end
