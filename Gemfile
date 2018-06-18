# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.1"

gem "rails"
gem "pg"
gem "puma"
gem "sass-rails"
gem "font-awesome-rails"
gem "uglifier"
gem "bootstrap"
gem "jquery-rails"
gem "simple_form"
gem "paperclip"
gem "devise"
gem "kaminari"
gem "coffee-rails"
gem "turbolinks"
gem "jbuilder"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara"
  gem "selenium-webdriver"
  gem "rspec-rails"
  gem "database_cleaner"
end

group :development do
  gem "web-console"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen"
  gem "factory_bot_rails"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
