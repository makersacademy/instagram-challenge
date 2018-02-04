Instagram Challenge
===================

## Task

Build Instagram

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

### User stories

```
As a user
So that other people can see what I am doing
I want to be able to post pictures

As a user
So that people know what is the context of the picture
I want to be able to add a caption and location

As a user
So that I can see what other people are doing
I want to see all pictures in reverse chronological order

As a user
So that I can see where the pictures were taken
I want to see the locations

As a user
So that I will be able to use Instagram
I want to sign up with email and password

As a user
So that I will be able to come back without signing up again
I want to be able to log in and log out

As a user
So that I can tell people I like their pictures
I want to be able to click on the like button

As a user
So that I can tell people what I think about their pictures
I want to be able to write comments on pictures

```
## Set up:

```bash
git clone git@github.com:Xin00163/instagram-challenge.git
cd instagram-challenge
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails server #  localhost:3000
```
### Tests

```bash
bin/rails db:migrate RAILS_ENV=test # Ensure your test environment is updated
bundle exec rspec # Runs the whole test suite
bundle exec rspec path/to/spec_file # Runs a single spec
```

### Dependencies

- Paperclip: A file attachment library for ActiveRecord. This was used for the image upload functionality of the app. Visit [Paperclip](https://github.com/thoughtbot/paperclip) documentation for more information.

```
$ brew install imagemagick
$ gem 'paperclip'
$ bundle install
```
### Live on Heroku
[Demo on Heroku](https://xin-instagram.herokuapp.com/users/sign_in)

### Looks like this:
[Homepage](https://i.imgur.com/CgZgddE.png)
