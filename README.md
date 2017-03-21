# Instagram Challenge
### Makers Academy Weekend Challenge No.8

[![Build Status](https://travis-ci.org/KatHicks/instagram-challenge.svg?branch=master)](https://travis-ci.org/KatHicks/instagram-challenge) [![Coverage Status](https://coveralls.io/repos/github/KatHicks/instagram-challenge/badge.svg?branch=master)](https://coveralls.io/github/KatHicks/instagram-challenge?branch=master) [![Code Climate](https://codeclimate.com/github/KatHicks/instagram-challenge/badges/gpa.svg)](https://codeclimate.com/github/KatHicks/instagram-challenge)

### Instructions

As usual, we were given from the end of the day on Friday until 9am on Monday to complete the challenge.

### Task

As the final weekend challenge, we were given minimal direction.

Instructions:

> Build Instagram: simple huh!

> Bonus if you can write your own set of sensible user stories!

> As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to initialize a Rails app in the current directory.

> Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

> Bonus if you can add filters!

### Using my application

* Clone the repository and navigate inside the folder on your command line
* Run `$ bundle` to install all the dependencies from the Gemfile into your repository
* Run `$ bin/rake db:create` to create the development and tests databases needed for the app
* Run `$ bin/rake db:migrate` to get the database tables configured according to the schema
* Run `$ bin/rails server` and then navigate to `http://localhost:3000` to view the app locally in the browser
* You will need to sign up to access the full functionality of the app
* If you'd like to run the tests, run `$ rspec` in the command line to see formatted documentation

### Dependencies

* Written using **Ruby 2.3.3** and the **Ruby on Rails** web framework
* Tested using **RSpec** and **Capybara**
* Built on a **PostgreSQL** database using **ActiveRecord** as the ORM
* Used various gems for the tests:
  * **Timecop** to mock time
  * **Orderly** to test the order of content on a page
  * **Shoulda** to test the database associations
* Used **Paperclip** for the upload of images
* Used **Devise** to create secure user accounts

### Steps in my development process

* **Setting up Rails**
  * Started off by initialising a Rails app in the repository

### Ideas for extension

* **Use AJAX for like functionality**
  * Currently page needs to be reloaded for new likes to appear
