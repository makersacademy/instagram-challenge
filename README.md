# Instagram Challenge

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

# Task

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to initialize a Rails app in the current directory.

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

# Installation

To install Georgestagram (setting up your database and running tests), type the below into your command line:

```
$ git clone git@github.com:gweaton/instagram-challenge.git
$ cd instagram-challenge
$ rake db:setup
$ rspec
```

To run Georgestagram, type the following:
```
$ rake db:seed
$ bin/rails server
$ open http://localhost:3000
```

You can upload and delete photos, and add comments and likes to individual photos.

# Technologies used

  - Ruby on Rails
  - HAML
  - ActiveRecord (for databases)
  - Devise (for sign up/sign in functionality)
  - Omniauth (for login through Facebook)
  - Paperclip (for uploading photos)

# Still to come

  - Using AJAX and Jquery to update likes in real-time.
  - CSS styling
  - Filters on photos
