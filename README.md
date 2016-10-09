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

Features:
-----

[x] adding posts
[x] displaying posts
[x] adding pictures
[x] displaying pictures
[ ] adding comments
[ ] displaying comments
[ ] adding users
[ ] log in
[ ] Facebook log in
[ ] features for logged in users
[ ] bootstrap
[ ] running, live project

Ruby on Rails setup:
-----

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
- that's it! Good idea to commit your project now!

Feature tests:
-----

- create `spec/features/` dir, add a file `posts_feature_spec.rb`:
```require 'rails_helper'

feature 'posts' do
  context 'no posts' do
    scenario 'should display a prompt to post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end
end
```
-

Adding routes:
-----
- in `config/routes.rb` add `resources :posts`
- `rake routes` in cmd will display current routes
- `rails g controller posts` to generate a controller inside `app/controllers` and related view files
- now in controller `posts_controller.rb` add to display a basic page::
```def index

end
```
- in `app/views/posts/index.html.erb`:
```No posts yet
```

Creating a mode:
-----
- `rails g model post name:string content:string` (note singularity of 'post' - this is important!)
- run `rake db:migrate` and `rake db:migrate RAILS_ENV=test` if needed
- to remove a migration `rails d migration MigrationName`, then `rake db:drop db:create db:migrate` (+ test environment if required)
