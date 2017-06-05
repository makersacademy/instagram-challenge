Instagram Challenge
===================

Instagram clone using Rails. Users can post pictures, write comments and like pictures.

Technologies
-----------

Ruby on Rails, RSpec, PostgreSQL, Devise, CarrierWave, AWS.

![Screenshot](https://raw.github.com/sophieklm/instagram/master/img/chitter_screenshot.png)

Use
-------------

This application uses fog storage on AWS buckets for development and production and file storage for testing.
Environment vars can be set up using figaro.

````
$ git clone https://github.com/sophieklm/instagram.git
$ cd Instagram
$ bundle install
$ rake db:setup
$ rspec
$ rails server
$ open http://localhost:3000
````

User stories
--------
`````````````
As a user
So that I can be part of a photo sharing community
I want to be able to create an account

As a user
So that I can ensure no one else posts photos as me
I want to be able to sign in and out

As a user
So that I can share my photos
I want to be able to upload an image to the site

As a user
So that I can interact with others
I want to be able to comment on a photo

As a user
So that I can show that I like a photo
I want to be able to 'like' a photo

As a user
So that I can see pictures I have shared
I want to have a profile page

As a user
So that I can exaggerate how good my photography skills are
I want to be able to add a filter to an image
````````````
