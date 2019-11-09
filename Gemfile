source 'https://rubygems.org'
ruby '2.6.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.2'
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.1'

gem 'acts_as_votable', '~> 0.10.0'
gem 'bootstrap', '~> 4.3.1'
gem 'database_cleaner'
gem "font-awesome-rails"
gem 'jquery-rails'
gem 'sass-rails', '>= 6'
gem 'simple_form', '~> 4.0.1'
gem 'travis-lint'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'rubocop', '~> 0.76.0', require: false
  gem "rubocop-rails_config"
  gem 'travis'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'timecop'
  gem 'webdrivers'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
