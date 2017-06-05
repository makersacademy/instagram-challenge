Instagram Challenge
===================
##Instagram challenge  

#Clone the repo
#bundle install
#rails db:create
#rails db:migrate

#Tehnologies

Ruby version: 2.4.0
Database: postgresql (pg)
Rails version: 5.1.1
Linter: Rubocop/ Rubocop-rails
Testing: RSpec-Rails / Capybara

#Dependencies:

-Paperclip
-Devise
-Simple form
-masonry-rails
-acts_as_votable
-coffee-rails
# Functionality

-# user can sign up, sign in, sign out
-# user can add photo, comment, edit, upload, like a photo

- The functionality of the app is working properly , I was blocked by writing
- any test because of the error : "Ambiguous match, found 2 elements matching xpath "/html"".

## Instructions

* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, copy the .rubocop.yml from the AceBook challenge. You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
