Instagram Challenge
===================

[![Build Status](https://travis-ci.org/jordantroberts/instagram.svg?branch=master)](https://travis-ci.org/jordantroberts/Foodstagram)[![CodeCov](https://img.shields.io/codecov/c/github/jordantroberts/instagram.svg)](https://codecov.io/gh/jordantroberts/Foodstagram)


Week 8 weekend challenge: build an Instagram clone using Rails. Instructions: you'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

## Installing this app
1. Clone this repo
2. Run `bundle install` from the command line
3. Run `bin/rails db:create` and then `bin/rails db:migrate` from the command line

## Testing this app
Run `bundle exec rspec` from the command line

## Using this app
Run `bin/rails server` and visit http://localhost:3000

## Build Status

All user stories have been implemented and an MVP achieved! :) Users can sign up from the index page, log in, upload pictures, comment on pictures, like and unlike pictures. I have taken into account certain edge cases such as they can only like a post once, and they cannot sign up with the same email address.

If I had more time, I would like to focus on additional elements such as deleting or updating a comment. It would also be cool to build a user profile page for each user.

## User Stories

```
As a hungry person
So that I can drool over pictures of delicious food
I would like to sign up for an account on Foodstagram.

As a user
So that I only need to sign up once
I would like to be able to login to my existing account.

As a foodie
So that I can share pictures of my own meals
I would like to be able to post a picture to Foodstagram.

As a user
So that I can share my opinions on other people's food pics
I would like to be able to comment on other pictures.

As a user
So that I can share my appreciation for food
I would like to be able to like pictures.

As a user
So that I can change my mind
I would like to be able to unlike pictures I have liked.
```

## Screenshots

<div align="center">
    <img src="LatestScreenshot.png" width="800px"</img>
</div>

<div align="center">
    <img src="UploadScreenshot.png" width="800px"</img>
</div>

## What I learned from this challenge

* I wanted to gain a deeper understanding of how the Rails MVC model works, which was my main reason for starting this challenge. As a result, I do have a better understanding of how Rails models, views and controllers interact with each other and the Rails routing process.
* I have a better understanding of Active Record migrations, and features such as validations.
* I learned how to utilise different tools such as `devise` and `paperclip` which I hadn't used before.
* Practice with continuous integration tools such as Travis - how to set this up and use in my project.
* More practice testing in a Rails project and using CodeCov to check my coverage.

## Acknowledgments
- Jordan Roberts
- Makers Academy Challenge
- For help with which gems to use and to get started, I referred to Chapters 1 and 2 of <a href="https://github.com/benwalks/Lets-Build-Instagram-Free-Book">this</a> tutorial when I got stuck.
- For the like and unlike function, I followed <a href="https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2">this</a> tutorial.
