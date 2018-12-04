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

#### Signing up
<img width="939" alt="screenshot 2018-12-04 at 11 39 10" src="https://user-images.githubusercontent.com/41509062/49439903-392c9180-f7ba-11e8-97ac-fa77f7e9cfa1.png">

#### Image feed
<img width="942" alt="screenshot 2018-12-04 at 11 41 09" src="https://user-images.githubusercontent.com/41509062/49439904-392c9180-f7ba-11e8-8f58-7d9531c73d5d.png">

#### Personal feed
<img width="942" alt="screenshot 2018-12-04 at 11 41 22" src="https://user-images.githubusercontent.com/41509062/49439905-392c9180-f7ba-11e8-9b29-c7b8c362fe5a.png">

#### Edit post
<img width="943" alt="screenshot 2018-12-04 at 11 41 33" src="https://user-images.githubusercontent.com/41509062/49439906-39c52800-f7ba-11e8-9d93-d945d296101b.png">

### Delete post
<img width="941" alt="screenshot 2018-12-04 at 11 42 26" src="https://user-images.githubusercontent.com/41509062/49439909-39c52800-f7ba-11e8-98f2-d76690b1d005.png">

#### Edit login details
<img width="940" alt="screenshot 2018-12-04 at 11 41 54" src="https://user-images.githubusercontent.com/41509062/49439907-39c52800-f7ba-11e8-92ed-4f46e703b783.png">


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


## User stories

#### MVP

```
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
```

#### Extra Features (Not yet completed)

```
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
```
