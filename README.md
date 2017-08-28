Instagram Challenge
===================

## Challenge

The challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## User stories

```
A user can sign up for an account
A user can log in to their account
A user can create a new image post
A user can view the feed of image posts to see who has posted what
A user can comment on posts
A user can view comments on posts
A user can like posts
A user can view the number of likes on a post
```

## Instructions

production:
http://tobstagram.herokuapp.com/

development:
```
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails server
```

test:
```
bundle install
bin/rails db:create
bin/rails db:migrate RAILS_ENV=test
bundle exec rspec
```
