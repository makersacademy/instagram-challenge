Instagram Challenge
===================

[![Build Status](https://travis-ci.org/lauraweston/instagram-challenge.svg?branch=master)](https://travis-ci.org/lauraweston/instagram-challenge)

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

Solution
--------
Ruby version: 2.3.1

## Installation
- ``` git clone https://github.com/lauraweston/instagram-challenge.git```
- ```cd instagram-challenge```
- Install dependencies:   
```gem install bundle```    
```bundle install```

## Usage
- Start Rails web server: ```bin/rails server``` or ```bin/rails s```
- Navigate to [http://localhost:3000] (http://localhost:3000) 

## Database
- Install [postgres] (https://www.postgresql.org/)
- ```bin/rake db:create```

## Testing
- ```rspec```