Instagram Challenge
===================
## "Pinstagram"
An app built using Ruby on Rails mimicking the functionality of a well known picture posting app.

## Preview
![Preview of Pinstagram](./public/images/preview.gif)


## User stories for Pinstagram
```
As a user
So I can show people what I am up to
I can post a picture to a public feed

As a user 
So Pinstagram is all about pictures
I cannot make a post unless I have uploaded an image

As a user
So I can see lots of images on the feed
I would like to see all uploaded images on the feed at once

As a user
So I can admire a beautiful photo
I would like to be able to view images on their own 

As a user 
So I can correct a mistake in my caption/photo upload
I can edit my post

As a user
So I can remove all evidence of me in 2013
I can delete posts on my Pinstagram
```

## Getting started
* `git clone` this repo
* `cd` into it
* Run `bundle install` to install dependencies
* Run `rails:db create` and then `rails db:migrate` to set up the databases
* Run `rails s` to start up the server
* Run `rspec` to check if tests are passing
* Naviagte to http://localhost:3000/

## Built using
* Ruby on Rails
* Ruby
* Bootstrap
* RSpec/Capybara

## Features
* User can post a photo to a stream
* View photos on their own
* Edit uploads
* Delete uploads
* Liking photos
* User sign in/log in/log out
* Commenting on posts
