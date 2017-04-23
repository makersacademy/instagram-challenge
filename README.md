# Instagram Challenge - Makers Academy Weekend Challenge for Week 8

[![Build Status](https://travis-ci.org/varvarra/instagram-challenge.svg?branch=master)](https://travis-ci.org/varvarra/instagram-challenge)
[![Coverage Status](https://coveralls.io/repos/github/varvarra/instagram-challenge/badge.svg?branch=master)](https://coveralls.io/github/varvarra/instagram-challenge?branch=master)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/codeclimate/codeclimate)

Challenge time: one weekend

The challenge was to build Instagram using Rails. An app should have users who can post pictures, write comments on pictures and like a picture.


## Using this application

- Download the source code using ``$ git clone``
- Navigate into the root of the directory using ``$ cd instagram-challenge``
- Install all the dependencies by running the command ``$ bundle install`` in the root directory

- Download PostgreSQL (if you do not already have it installed)
- `brew install imagemagick` for uploading pictures
- `brew install phantomjs`
- Within the command line, run `$ bin/rake db:create` and then `$ bin/rake db:migrate`
- Run the app using the command `$ bin/rails server`
- Go to localhost:3000 in rout browser to view and interact with the app

## Running the tests

Within the root of the directory, run `$ rspec` to see the results of the tests in the command line

## Dependencies

- Application written in Ruby 2.3.3 and built using Ruby on Rails
- Based on a PostgreSQL database with ActiveRecord as the ORM
- Tested using RSpec and Capybara
- Uses Paperclip gem for uploading pictures
- Uses Devise for User Sign up and Log in


## User Stories

```
  As a user
  So that I post pictures
  I need to register and log in to the website
```
```
  As a user
  So that I can post pictures
  I want to be able to upload a picture
```

```
  As a user
  So that I can interact with other users
  I want to be able to leave comments on their pictures
```

```
  As a user
  So that I can interact with other users
  I want to be able to leave 'likes' on their pictures
```

## Approach

- In the very beginning I decided to have **picture** model to represent each post, with description and image as its properties.
Each picture has **comments** and **likes**, represented by their own models. Each picture also belongs to a **user**, created with the help of devise gem.  

- I have built a schema based on this domain model

## Refleciton

If I had a chance to start the project from the beginning, I would work more on the following:
- would use `factory_girl` gem as a factory of objects for my tests. Unfortunately I've learnt about this gem quite late to change my tests. Otherwise, the tests would look more more concise, neat, easier to implement

- would change the name of the 'Picture' model to the 'Post' model.
