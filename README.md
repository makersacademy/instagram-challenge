Instagram Challenge
===================
[![Build Status](https://travis-ci.org/richgeog/instagram-challenge.svg)](https://travis-ci.org/richgeog/instagram-challenge) [![Test Coverage](https://codeclimate.com/github/richgeog/instagram-challenge/badges/coverage.svg)](https://codeclimate.com/github/richgeog/instagram-challenge/coverage)[![Code Climate](https://codeclimate.com/github/richgeog/instagram-challenge/badges/gpa.svg)](https://codeclimate.com/github/richgeog/instagram-challenge)

##Task

Build Instagram: Simple huh!

Build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

##How to setup

````
https://github.com/richgeog/instagram-challenge.git
cd instagram-challenge
bundle
bin/rake db:create or bin/rake db:create RAILS_ENV=test
bin/rake db:migrate
bin/rails s or bin/rails server
````

Go to localhost:3000

##Testing

````
rspec
````

##V1

* Users can sign up and sign in
* Users can post images with a title/description
* Users can edit and delete the image and title
* Users can post a comment of the photo
* Users can view thier image as a larger image in a new window

##Still to do

* Users can sign in via facebook
* Only users who are signed up/in can upload images
* Only the user who uploaded the image can edit and delete it
* Only the user who wrote the comment can edit or delete the comment
* Likes to photos still to be implemented
* Testing of images
* Use factory girl
* Use of partials
* CSS
* Deploying to heroku

##Things to remember

* Set up rails with `rails new [filename] -d postgresql -T`
* `rake routes` - lists all available paths
* When using haml, install haml gem
* `bin/rails g controller [filename]`
* `bin/rails g model [modelname], name:string rating:integer`
* `bin/rails g migrtion AddDescriptionToRestaurants description:text`
* `bin/rails g migration AddRestaurantIdToReviews restaurant:belongs_to`
* Haml indentation is a major problem if wrong, rspec tests will fail!!!
* Setting up sign-in, up and out, use `gem 'devise'`, `bin/rails g devise:install`, `bin/rails g devise User`


