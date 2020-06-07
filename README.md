# Instagram Challenge

[![Build Status](https://travis-ci.com/will-head/instagram-challenge.svg?branch=master)](https://travis-ci.com/github/will-head/instagram-challenge/builds/170080957)

## Setup

```bash
$ bundle install  
$ npm install  
$ yarn install --check-files
$ rake db:create
$ rake db:migrate

```

## Testing

To run RSpec (with coverage), Rubocop, Jasmine in Karma (with coverage) and ESLint run script:  

```bash
$ ./test/tdd.test
```
To test in browser (uses Chrome), run script:  

```bash
$ ./test/web.test
```
## User Stories  

```
As a user
So I can upload content to the site
I want to be able to sign up for an account
```

```
As a user
So I can upload content to the site
I want to be able to log into the site
```

```
As a user
So I can ensure no one can use my account without my permission
I want to be able to log out of the site
```


# Original README

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
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
