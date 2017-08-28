Instagram Challenge
===================

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

Features:
-------

```

As a User
So that I can let people know what I am doing  
I want to post a photo with a caption on instagram

As a User
So that I can see what others are saying  
I want to see all posts in reverse chronological order

As a User
So that I can better appreciate the context of a post
I want to see the time at which it was made

As a User
So that I can post messages on instagram as me
I want to sign up for instagram

As a User
So that only I can post messages on instagram as me
I want to log in to instagram

As a User
So that I can avoid others posting messages on instagram as me
I want to log out of instagram

As a User
So that I can that share my opinion on a post
I want to be able to like a post

As a User
So that I can that share my opinion on a post
I want to be able to make a comment on a post

```
# How to set up the app locally:

```bash
git clone git@github.com:funmia/instagram-challenge.git
cd instagram-challenge
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails server #  localhost:3000
```
## Tests

```bash
bin/rails db:migrate RAILS_ENV=test # Ensure your test environment is updated
bundle exec rspec # Runs the whole test suite
bundle exec rspec path/to/spec_file # Runs a single spec
```

# Dependencies

- Paperclip: A file attachment library for ActiveRecord. This was used for the image upload functionality of the app. Visit [Paperclip](https://github.com/thoughtbot/paperclip) documentation for more information.

```
$ brew install imagemagick
$ gem 'paperclip', '~> 4.1'
$ bundle install
```
