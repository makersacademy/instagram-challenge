# Instagram challenge - weekend 8

[![Build Status](https://travis-ci.org/Debora38/instagram-challenge.svg?branch=master)](https://travis-ci.org/Debora38/instagram-challenge)

### User stories

```
As a user,
so that I can join Instagram,
I want to be able to sign up

As a user,
so that I can personalise my account,
I want to be able to choose a username

As a user,
so that I can close the app,
I want to be able to log out

As a user,
so that I can re-open my same account,
I want to be able to log in

As a user,
so that I can share my thoughts,
I want to be able to post a message to the homepage

As a user,
so that I can share my adventures,
I want to be able to post pictures to the homepage

As a user,
so that I can keep myself updated,
I want to see the latest posts on top

As a user,
so that I can share my appreciation,
I want to like the posts

As a user,
so that I can change my mind,
I want to be able to remove a like to a post

As a user,
so that I can correct my posts,
I want to be able to edit them

As a user,
so that I can change my mind,
I want to be able to delete my posts

As a user,
so that I can leave the application,
I want to be able to delete my account along with the content
```

## Approach

This challenge helped me repeat few concepts ferom the week's learnings, such as **Rails** and the **gem Devise**, which handles user authentication.<br>
The app is not complete, however it allows authentication and posting one image per post, with a message.<br>
Most of the challenge was spent getting familiar with Rails and setting up devise correctly.

### Screenshot of main page
<img src='https://github.com/Debora38/instagram-challenge/blob/master/app/assets/images/Screenshot%202019-03-03%20at%2022.30.57.png?raw=true' alt='main-page'>

### Instructions to setup

Locally clone this repo
```
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec
> bin/rails server
```
You can then connect to http://localhost:3000
