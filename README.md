![Build Status](https://travis-ci.org/kitkat119/instagram-challenge.svg?branch=master)

Instagram Challenge
===================

###### Makers Academy Weekend Challenge (Week 8)

An Instagram clone for sharing your cutest cat pictures!

##### How to use:

```bash
# clone and move into the repo
git clone https://github.com/kitkat119/instagram-challenge
cd instagram-challenge
# install dependencies
bundle install
# create kittygram_development and kittygram_test databases
bin/rails db:create
# migrate the databases
bin/rails db:migrate
# run the server
bin/rails server
# Visit https://localhost:3000
```
##### To run the tests:
```
bundle exec rspec
```
### User Stories

```
As a user
So that I can be part of the Kittygram community
I want to be able to sign up as a user

As a user
So that I can let other users know who I am
I want to be able to add a username, bio and profile pic to my profile

As a user
So that I can show off about my cats
I want to be able to post a picture

As a user
So that I can tell people what I think of their cute cats
I want to be able to comment on pictures

As a user
So that I can show appreciation for a cute kitty
I want to be able to like a picture

As a user
So that I can enjoy using Kittygram
I want the website to be styled nicely, maybe like Instagram

BONUS

As a user
So that I can make my kitties look their best
I want to be able to apply a filter to my pictures
```

##### Tech Stack
* Ruby on Rails
* Devise
* Factory Girl
* Carrierwave
* PostgreSQL
* Rspec 
