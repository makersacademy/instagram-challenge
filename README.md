My Approach
===========

The app was created with Ruby on Rails. Feature tests have been created using the Cucumber BDD framework. Factory_Girl was used to create test objects during feature testing. The following features have been implemented.

* User can create, read, update and delete posts (pictures)
* User can create, read, update and delete comments.

Instructions
------------

To run this application, you will need to do the following:

* install postgresql to your machine
* clone this repo
* bin/rake db:create
* bin/rake db:migrate
* bin/rails server

TODO:
-----

The following features need to be implemented.

* Style the website
* Implement Likes
* Deploy to Heroku

Instagram Challenge
===================

Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use Google, your notes, books, etc., but work on your own
* You must submit a pull request to this repo with your challenge solution (or partial solution) by 9AM Monday morning.

Task
-----

Build Instagram: Simple huh!

As usual please start by

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
* Forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
