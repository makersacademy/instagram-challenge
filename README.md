Instagram Challenge
===================

[![Build Status](https://travis-ci.org/Leigan0/instagram-challenge.svg?branch=master)](https://travis-ci.org/Leigan0/instagram-challenge)

This is my first solo app created using the Rails framework, completed over a weekend.

I have attempted to recreate the basic functionality of instagram using a rails framework. I have aimed to complete the challenge following TDD process.

In order to build my understanding of rails I have created this project without using the scaffold command to help my learning of the framework.

I have attempted to write controller and model tests, but given more time I would work on this. I have mainly implemented the app using feature testing.

Given more time I would increase functionality. I would improve my controller and model tests, and gain further insight into these areas. Whilst I have feature tests the testing needs to be improved for greater test coverage of the features of the app. The feature test I have could also be refactored to remove duplication.

I have had a focus on learning rails basics, so I am aware improvements are needed in the convention, and there are areas of the tests and code base which could by improved with helper methods.

## Getting started

* Git clone https://github.com/Leigan0/instagram-challenge.git
* cd to repo
* bundle
* To start server - bin/rails s
* Navigate to http://localhost:3000/


## Technologies used
* Rails
* Ruby
* HTML
* CSS
* Devise
* Bootstrap Framework
* Paperclip
* Rspec
* Capybara
* Factory bot

## What it looks like

![alt text](https://i.imgur.com/6G91oUU.jpg), ![alt text](https://i.imgur.com/bN1EzTu.png)

## Functionality implemented
* User sign in and out
* User can post pictures
* User can add caption
* Users can comment on posted pictures
* Pictures can be edited
* Comments can be edited
* Users can only view feeds, users have to sign in for extra functionality
* User emails displayed for comments / posts

## User Stories

* As a user, so I can advertise my life, I would like to be able to post a picture
* As a user, so I can explain my picture choices, I would like to be able to add a caption to a picture
* As a user, so I can feedback on peoples pictures, I want to be able to add a comment to picture posts
* As a user, so people know I posted the picture, I want my username to be added to my post
* As a user, so I can save time, I want to be able to login in using my existing social media account details
* As a user, so I really get the Instagram feel, I want the webpage to look like Instagram
* As a user, so I can save time, I want to be able to add a like to a picture
* As a user, so I can add a category to my picture, I want to be able to add a hashtag
* As a user, so I can search for similar pictures, I want to be able to filter pictures by hashtag
