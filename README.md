Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

Ruby on Rails setup:

- `mkdir` your_project_name
- `cd` into the project
- proceed with the step only if you want to use specific/older version of Rails:
`touch` Gemfile and add the following content (for the newest 4 version):
```source 'https://rubygems.org'
gem 'rails', '~> 4'
```
then run `bundle` and `rails --version` should output your desired version in my case:
> Rails 4.2.7.1

- now run `rails new . -d postgresql -T`, where `.` will use current directory, `-d` specify database to postgresql and `-T` disable Rails default testing framework. Running `rails` in terminal will provide all possible options, in case of any conflicts with existing files (like a Gemfile from the previous step) just overwrite them
- `rails s` should run your server now (default `http://localhost:3000` in your browser)
- `rake db:create` will set up database for you (additional `bin/rake db:create RAILS_ENV=test` may be required to create a separate one for testing, depending on your system)
- to use RSpec and Capybara for your test the following content needs to be added into Gemfile (+ `bundle`):
```group :test do
  gem 'rspec-rails'
  gem 'capybara'
end
```
- run `bin/rails generate rspec:install` to generate RSpec files
- add `require 'capybara/rails'` to `spec/rails_helper.rb`
-
