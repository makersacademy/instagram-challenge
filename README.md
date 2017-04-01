# Instagram Challenge

[![Build Status](https://travis-ci.org/treborb/instagram-challenge.svg?branch=master)](https://travis-ci.org/treborb/instagram-challenge)
[![codecov](https://codecov.io/gh/treborb/instagram-challenge/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/instagram-challenge)

## [Makers Academy](http://www.makersacademy.com) - Week 8 - Solo Weekend Challenge

## Technologies
* [Ruby v2.3.3](https://www.ruby-lang.org/en/)
* [Ruby on Rails v5.0.1](http://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Slim Template](http://slim-lang.com/)
* [Rspec](http://rspec.info/)
* [Capybara](https://github.com/teamcapybara/capybara)

## Jump To
* [User Stories](#user-stories)
* [Installation](#install)
* [Usage](#usage)
* [Tests](#tests)
* [Heroku Demo](#demo)
* [Screenshots](#screenshots)

## The Brief

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add image filters!

## <a name="user-stories">User Stories</a>

```
As a user,
So that I can use the site securely
I need to be able to sign up for an account securely

As a user,
So that I can have an online identity
I need to be able to add a profile picture to my account

As a user,
So that nobody else uses my account
I need to be able to sign out of my account

As a user,
So that I can use the site again
I need to be able to sign back in to my account

As a user,
So that I can show my friends what I am eating
I want to be able to post pictures to the website

As a user,
So that I can show my appreciation of a posts
I want to be able to like others' posts

As a user,
So that I interact with my the community
I want to be able to comment on others' posts

As a user,
So that I can make my pictures look funky
I want to be able to apply colour filters to my post's pictures
```

## <a name="install">Installation</a>

You will need to have [PostgreSQL](https://www.postgresql.org/) installed before proceeding with the below installation instructions.

```ruby
$ git clone https://github.com/treborb/instagram-challenge.git
$ cd instagram-challenge
$ rvm 2.3.3
$ gem install bundler
$ bundle
$ bin/rake db:create
$ bin/rails db:environment:set RAILS_ENV=development
$ bin/rake db:schema:load
```

## <a name="usage">Usage</a>

Follow the installation instructions above, then:

```sh
$ bin/rails server
$ open http://localhost:3000
```

## <a name="tests">Running the tests</a>

```sh
$ rspec
```

## <a name="demo">[Heroku Demo](http://robs-instasham.herokuapp.com/)</a>
Click on the link above to see a live demo

## <a name="screenshots">Screenshots</a>

![Instasham - Homepage](http://0127599070f05b20f2ae-cf41a704c6c093350fcb8a1fb943b3e5.r25.cf5.rackcdn.com/github-readme-images/instasham/home.png)

![Instasham - Log in](http://0127599070f05b20f2ae-cf41a704c6c093350fcb8a1fb943b3e5.r25.cf5.rackcdn.com/github-readme-images/instasham/log-in.png)

![Instasham - Add a post](http://0127599070f05b20f2ae-cf41a704c6c093350fcb8a1fb943b3e5.r25.cf5.rackcdn.com/github-readme-images/instasham/add-post.png)
