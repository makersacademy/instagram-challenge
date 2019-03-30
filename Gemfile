# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'devise', '~> 4.2'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma'
gem 'rails', '~> 5.2', '>= 5.2.3'
gem 'travis', '~> 1.8', '>= 1.8.8'

group :development, :test do
  gem "rubocop", '~> 0.66.0', require: false
  gem 'rubocop-rails_config', '~> 0.4.4'
  gem 'capybara', '~> 3.16'
  gem 'selenium-webdriver', '~> 3.141'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'simplecov', '~> 0.12.0'
end