Instagram Challenge
===================

* Had a bit of 'one of those days' working on this - lost a LOT of time to some obscure bugs (including: my test and development databases not being mirrored, my sessions persisting across server reboots etc and locking me out of the site, test databases not cleaning between tests, bcrypt working on the dev db but not the test db, and a few other real timesinks). Was a shame as felt I was really getting to grips with the wider concepts of rails routing and basic app building.
* As such, no styling done, and didn't get round to implementing likes. The structure is there though!

## User Stories

As a user
So that I can be part of Instagram
I would like to sign up

As a user
So that I can use Instagram as myself
I would like to log in

As a user
So that I can share my perfect life with my friends and make them jealous
I would like to upload pictures

As a user
So that I can tell my friends they look :flame:
I would like to comment on pictures

As a user
So that I can try and unsubtly get someone's attention
I would like to like pictures


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
