# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.1'

gem 'bootstrap-sass'
gem 'devise'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.1'
gem 'rubocop', '~> 0.59.2', require: false

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'rspec-rails', '~> 3.5'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'simplecov-console'
end
