require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/' # for rspec
  add_filter '/app/channels/'
  add_filter '/app/jobs/'
  add_filter '/app/mailers/'
end

require 'capybara/rspec'
require 'selenium/webdriver'
Capybara.javascript_driver = :selenium_chrome_headless

RSpec.configure do |config|

  config.before(:each, type: :system, js: true) do
    driven_by(:selenium_chrome_headless)
  end

end
