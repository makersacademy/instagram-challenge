# Instagram Challenge

A simple instagram clone built over a weekend using Ruby on Rails.

Users can create an account, upload photos, comment on others, and like a post.

# User stories

```
As a user
So I can share my pictures
I can upload photos to Instagram

As a user
So I can see people's photos
I can view pictures

As a user
So I can clear up my feed
I can delete pictures

As a user
So no one can post anything pretending to be me
I have my own account

As a user
So I can tell people what I think of their pictures
I can post a comment

As a user
So I can show my appreciation for other people's snaps
I can like pictures

```
# Installation

To install Georgestagram, follow these instructions:

 - Fork this repo
 - Clone it to your local machine by running `$ git clone git@github.com:[USERNAME]/instagram-challenge.git`
 - Navigate to your instagram-challenge directory
 - Run `bundle install`
 - Run `rake db:setup` to set up your local database
 - Run `rspec` to run all the tests.

To run Georgestagram, type the following in your command line:
```
$ rake db:seed
$ bin/rails server
$ open http://localhost:3000
```

You can upload and delete photos, and add comments and likes to individual photos.

# Technologies used

  - Ruby on Rails
  - HAML
  - ActiveRecord
  - Devise (for sign up/sign in functionality)
  - Omniauth (for login through Facebook)
  - Paperclip (for uploading photos)

# Still to come

  - Using AJAX and Jquery to update likes in real-time.
  - CSS styling
  - Filters on photos
  - Uploading to AWS
  - Deploying to Heroku
