require 'coveralls'
Coveralls.wear!

require_relative 'rails_helper'
require_relative 'spec_helpers/comments_helper'
require_relative 'spec_helpers/posts_helper'
require_relative 'spec_helpers/sign_up_helper'

RSpec.configure do |config|

  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
