Instagram Challenge
===================

[![Build Status](https://travis-ci.com/afaraone/final-project.svg?branch=master)](https://github.com/djstephenson7/instagram-challenge)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://github.com/djstephenson7/instagram-challenge)
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/djstephenson7)
[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://github.com/djstephenson7)

# Mintstagram

A clone of Instagram, with all of its features. Users can signup, login and post photos.

## Getting Started

To get started, fork this repository. Open your terminal and navigate to the directory you wish to store this program in. In the Github repository, click on 'Clone or download' and copy the SSH key. In your terminal, type in 'git clone', paste the SSH key and press 'Enter'. You will now have a copy of our program on your machine.

### Prerequisites

This application uses Ruby on Rails. Please make sure you have the latest version of Ruby by following the instructions [here](https://www.ruby-lang.org/en/documentation/installation/)

### Installation

Before you can start the program, you first need to install its dependencies. Assuming you are in the root directory, run these commands in your terminal:

```
cd instagram-challenge
gem install bundler
bundle install
```
This application uses Postgresql for its database functions. Before starting the server, please run these commands:

```
rails db:create
rails db:migrate
```


You're now ready to begin. To start the server, run this  command in your terminal:

```
rails s
```

Then visit http://localhost:3000/

## How it works
<img width="939" alt="screenshot 2018-12-04 at 11 39 10" src="https://user-images.githubusercontent.com/41509062/49439903-392c9180-f7ba-11e8-97ac-fa77f7e9cfa1.png">
<img width="942" alt="screenshot 2018-12-04 at 11 41 09" src="https://user-images.githubusercontent.com/41509062/49439904-392c9180-f7ba-11e8-8f58-7d9531c73d5d.png">
<img width="942" alt="screenshot 2018-12-04 at 11 41 22" src="https://user-images.githubusercontent.com/41509062/49439905-392c9180-f7ba-11e8-9b29-c7b8c362fe5a.png">
<img width="943" alt="screenshot 2018-12-04 at 11 41 33" src="https://user-images.githubusercontent.com/41509062/49439906-39c52800-f7ba-11e8-9d93-d945d296101b.png">
<img width="940" alt="screenshot 2018-12-04 at 11 41 54" src="https://user-images.githubusercontent.com/41509062/49439907-39c52800-f7ba-11e8-92ed-4f46e703b783.png">
<img width="941" alt="screenshot 2018-12-04 at 11 42 26" src="https://user-images.githubusercontent.com/41509062/49439909-39c52800-f7ba-11e8-98f2-d76690b1d005.png">


## Running the tests

This has been tested with RSpec. To run, cd into the root directory and run:
```
rspec
```

This has been linted with RuboCop. To run, cd into the root directory and run:

```
rubocop
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used
* [Ruby](https://www.ruby-lang.org/en/documentation/) - Version 2.5.1

## Contributing

Please read fork this repo and submit a pull request with any suggested improvements, and I'll be happy to review them.


## Instructions

* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## User stories

# Everything above the line has been completed, while everything below is still to do

````
As a user,
So I can have an account on an amazing website,
I can sign up with my username, email and password.

As a user,
So I can access said website with my details,
I'd like to be able to login with my username and password.

As a user,
So I can dazzle people with my thoughtful pictures,
I can post images to my Mintstagram feed.

As a user,
So I don't accidentally post something compromising,
I'd like to be able to delete my posts.

As a user,
So I can see when posts were created,
I'd like to see the date and time they were posted.

As a user,
So I can stay updated to the latest information,
I'd like to see my posts in reverse chronological order.
_______________________________________________________________

As a user,
So I can tell my friends what I think of their pictures,
I'd like the ability to leave comments on pictures.

As a user,
So I can see what others think of my post,
I'd like to see other people's comments on my post.

As a user,
So I can show my approval.
I'd like to be able to 'like' other people's posts.

As a user,
So I can see how popular my posts are,
I'd like to be able to see the amount of likes on a post.

As a user,
So I don't accidentally give someone too much approval,
I'd like to be able to only like a post once.
