Instagram Challenge
===================

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
* Add profile picture to each user
* Add a profile page
* Add a page for each photo (displaying comments and likes)

## Lessons learnt so far

* If you want to use HAML you need to remember to install the gem!!
* After creating the one-to-many association between user and photos, you need to change the new and create methods in the photos controller in order to establish the association when the photo is created, otherwise the user_id is blank (see create and new methods in the photos controller)
* After adding the username to the user you have to ´rails generate devise:views devise´ if you want to modify the views in order to take in the username during the sign up and in order to accept that the user can also login via the username and not just the email.
   Also, you need to add a app/controllers/users/registrations_controller.rb and call it in config/routes.rb in the devise statement.

