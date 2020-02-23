Pinstagram
===================

## User Stories
```
As a user
So I can access my profile
I would like to be able to log in to Pinstagram

As a user
So only I can post on my account
I would like to be able to set a password on my account

As a user
So I can share pictures with my friends
I would like to upload a picture to my account

As a user
So I can alert my friends I have seen their pictures
I would like to be able to leave a like

As a user
So I can respond to a friend's pinstagram post
I would like to be able to leave a comment

As a user
So I can monitor my personal brand
I would like to be able to delete my own pinstagram posts

As a user
So I can perfect my captions
I would like to be able to edit the captions of my own posts

As a user
So I can backpedal on my sentiments
I would like to be able to delete my own comments

As a user
So I can see all my friend's posts in one place
I would like to be able to visit the homepage

As a user
So I can see all my posts in one place
I would like to be able to visit my Profile page

As a user
So I can see all the posts of a particular friend in one place
I would like to be able to visit their profile page

As a user
So I can add context to my pictures
I would like to be able to add a description to each post

---

As a product owner
So the focus stays on the images
I want it to be compulsory to attach a picture to each post
Even in the absence of a description

As a product owner
So the site is appealing to users
I would like it to be stylish yet understated

As a product owner
In order to protect free speech
I would like to prevents users from deleting others' comments on others' posts

As a product owner
To ensure a smooth user experience
I want the site to have smooth navigation
```

## Setup
### Database dependencies
In order to run this application, you would need to have `PostgresQL` installed.
To install postgresQL via `Homebrew`, you can run the following commands:

```s
$ brew install postgresql
$ brew services start postgresql
$ psql postgres
```

### Environment
Clone this repository, then run:
```s
$ yarn install --check-files
$ bundle install
$ bundle exec rails db:create
$ bundle exec rails db:migrate
$ bundle exec rails db:migrate RAILS_ENV=test
```

To run tests and linting:
```s
$ bundle exec rspec
$ bundle exec rubocop
```

## Features
### Authentication

> Users are given the opportunity to sign up and sign in<br />
  A user must have a unique email address, and their chosen email address must have a valid format<br />
  When signing up, all fields are required<br />

<img src="images/Pinstagram Authentication Pages alt.png" />

### Uploading Images

> Users can upload images to Pinstagram, and are given the opportunity to add a description to provide context<br />
  If a user wants, they are able to delete their posts, but this privilege is only available to 
  Users are able to edit their captions, and once the images has been uploaded other users are free to like and comment<br />

<img src="images/Pinstagram Uploading an Image.png" />

### Main Feed

<div align="center">
  <img src="images/Pinstagram-Scrolling.gif" height="600px" hspace="30" />
  <img src="images/Pinstagram-Leaving-a-comment.gif" height="600px" hspace="30" />
</div>
