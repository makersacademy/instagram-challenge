# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# My Set Up

1. `rails new instagram -d postgresql`

2. Inserted the following into the gemfile: 

`gem 'rspec-rails', '~> 3.5'` (in the development and test groups)

```
group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
```

3. `rails generate rspec:install`

4. Added rubocop gems and updated .rubocop-https according to instructions

5. 

