[![Build Status](https://travis-ci.org/RobinHeathcote/instagram-challenge.svg?branch=master)](https://travis-ci.org/RobinHeathcote/instagram-challenge)


Instagram Challenge
===================

Author:Robin Heathcote

Project Overview
-------

The task was to build a web based clone of Instagram built using Ruby on Rails. This includes sign-up/sign out functionality, the ability to upload photos with captions and the ability to comment and like photos. Posts are displayed on the homepage and can be viewed by users or guests and images can be clicked to see them individually with their comments. This project borrows its styling implementation from Ben Walker at https://www.devwalks.com which I used to teach myself CSS and bootstrap with HAML.

The page is hosted at: https://robin-instagram.herokuapp.com/posts

Screenshots
-------

Sign in Page:
![login form](https://www.dropbox.com/s/7f1mwhb9688gxea/Screen%20Shot%202016-05-31%20at%2008.54.12.png?raw=1)

Sign-up Page:
![sign-up form](https://www.dropbox.com/s/9faxz4cker6euvp/Screen%20Shot%202016-05-31%20at%2008.54.23.png?raw=1)

Edit or delete your post:
![edit-post](https://www.dropbox.com/s/oliiozadajahd9u/Screen%20Shot%202016-05-31%20at%2008.55.26.png?raw=1)

New post page:
![newpost](https://www.dropbox.com/s/secbased1zoqepd/Screen%20Shot%202016-05-31%20at%2009.00.42.png?raw=1)

Instructions
-------

To install and run locally:

```
$ git clone https://github.com/RobinHeathcote/instagram-challenge.git
$ cd instagram-challenge/
$ bundle
$ rails s
```

Technologies Used
-------

Ruby on Rails
HAML
Devise
Omniauth
Dot env
Rspec
Capybara
Paperclip
AWS - S3

Work in Progress
-------

This project is not yet completed. Things which require work:

Ability to delete your own comments
Ability to Like photos
Extract partials to clean up views
Better test coverage
Heroku deployment

User stories
-------

```
- As a user
- So I can keep my account secure,
- I want to be able to log in and log out

- As a user,
- So I can have a place to share photos,
- I want to be able to upload my photos

- As a user,
- So I can see what other people are up to,
- I want to be able to see other peoples photos

- As a user,
- So I can show that I like someones photo
- I want to be able able to click a like button


- As a user,
- So I can give feedback on photos or start a discussion,
- I want to be able to leave comments on a photo
```
