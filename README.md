# Instagam Challenge: InstaTAM

This project is a simple Instagram clone, allowing users to sign up or sign in via facebook, post photos, comment and like photos.

## User Stories

```
As an InstaTAM user,
So that I can post my photos
I want to be able to sign up for an account

As an InstaTAM user,
So that I can link my social media accounts
I want to be able to sign up for an account through Facebook

As an InstaTAM user,
So that I can post my photos
I want to be able to sign into my account

As an InstaTAM user,
So that nobody can post photos as me
I want to be able to sign out of my account

As an InstaTAM user,
So that I can share my photos with other users
I want to be able to post photos with captions

As an InstaTAM user,
So that I can share my thoughts on other photos
I want to be able to post a comment

As an InstaTAM user,
So that I can follow other users
I want to be able to view their posts

As an InstaTAM user,
So that I can follow other users
I want to be able to view the comments on their posts

As an InstaTAM user,
So that nobody can tamper with my account
I want to be the only person able to delete my own posts
```

## Additional Users Stories to follow

```
As an InstaTAM user,
So that I can share appreciations for other users' photos
I want to be able to like their posts

As an InstaTAM user,
So that I can see appreciations for photos others have shared
I want to be able to view the number of likes

As an InstaTAM user,
So that I keep track of likes on the posts
I want to be able to only like a post once

As an InstaTAM user,
In case I like a picture by accident
I want to be able to unlike a post

```

## Installation and Usage

* Fork and clone this repository
* Run `bundle install`
* Run `rake db:create` followed by `rake db:migrate` to create and set up required databases
* Type `rails s` into the command line to start up the local server
* Visit `localhost:3000` to use the app. Begin by signing up.

## Technologies

* Ruby on the Rails
* Postgresql
* RSpec and Capybara
* HTML and CSS
