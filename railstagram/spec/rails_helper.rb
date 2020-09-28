require 'spec_helper'
require_relative './helpers/sign_up.rb'
require_relative './helpers/make_post.rb'

if ENV['RAILS_ENV'] ||= 'test'
  require 'simplecov'
  SimpleCov.start
  puts "required simplecov"
end



require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara'

require 'support/database_cleaner.rb'

begin
  ActiveRecord::Migration.maintain_test_schema!

rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end
