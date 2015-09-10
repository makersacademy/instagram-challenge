Instagram Challenge
===================
[![Build Status](https://travis-ci.org/giusepped/instagram-challenge.svg)](https://travis-ci.org/giusepped/instagram-challenge)
[![Test Coverage](https://codeclimate.com/github/giusepped/instagram-challenge/badges/coverage.svg)](https://codeclimate.com/github/giusepped/instagram-challenge/coverage)

Overview
-------
This is a very basic clone of Instagram. User will be able to sign in, sign out, add pictures to their profile, view all the pictures in their feed, add likes, comments and tags.

## Installation

In your terminal do the following

```bash
$ git clone https://github.com/giusepped/instagram-challenge.git
$ cd instagram-challenge
$ bundle install
$ bin/rake db:create
$ bin/rake db:migrate
$ rails s # -b 0.0.0.0 when running on a VM
```

Visit localhost:3000

## Testing

Run Rspec

```sh
$ rspec
```

## [v1.0](https://github.com/giusepped/instagram-challenge/releases/tag/v1.0)

* Users can sign up, sign in, sign out
* Users can add pictures
* All pictures are displayed int he index
* Users can delete their own pictures
* Users have a username in addition to their email and password

## v2.0

* Add likes
* Add comments
* Add a page for each photo (displaying comments and likes)
* Add a profile page

## v3.0

* Add a profile picture to each user


## Lessons learnt so far

* If you want to use HAML you need to remember to install the gem!!
* After creating the one-to-many association between user and photos, you need to change the new and create methods in the photos controller in order to establish the association when the photo is created, otherwise the user_id is blank (see create and new methods in the photos controller)
* After adding the username to the user you have to ´rails generate devise:views devise´ if you want to modify the views in order to take in the username during the sign up and in order to accept that the user can also login via the username and not just the email.
   Also, you need to add a app/controllers/users/registrations_controller.rb and call it in config/routes.rb in the devise statement.
* The difference between a "HABTM" (has and belongs to many) and "HAS_MANY THROUGH" (using photos as a joint table) is that in HABTM there is not another model in between the two original models.
Pretty much the same goes for LIKES. Even if the likes do not necessarily have any text or image properties, pretty much whenever you can name the relationship, it makes sense to make a new model for it!
Why can't we use a "HATBM"? Because review actually has properties, it is not just a joint table in the background with the ids stored in!

