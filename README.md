
 BUILD STATUS: ![alt text]https://travis-ci.org/olwend/instagram-challenge.svg?branch=master

The challenge is to build Instagram using Rails.
This needs **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

User stories
============
As a User
I want to register/sign up
So that I can log in without entering details each time

As a signed in User
I want to post a thumbnail-sized image with title
So that I can communicate with my followers in pictures

As a signed in user
I want to add or edit an image description
So that I can give more information   

As a user browsing to the home page
I want to see a list of thumbnails and comments
So that users can read more about the images

As a user
I want to be able to 'like' a posted image
So that the user gets a good feeling

As a user
I want to be able to add comments on an image
So that we can get bantz going

As an owner
I want the images to be hosted on S3(AWS)
So that security and availability are managed by AWS

As a user
I want to be able to add tags
So that images can be filtered on topics

Steps to get the application up and running
=============================================

* Rails gem 5.0.1 (ruby 2.3.0-p0)

* System dependencies

To download:

* ```sh
$ git clone git@github.com:[USERNAME]/instagram-challenge.git
$ cd instagram-challenge
$ rake db:setup
$ rspec
```

To run app:

* ```sh
$ rake db:seed
$ rails s
$ open http://localhost:3000
```

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
