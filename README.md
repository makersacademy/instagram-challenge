Instagram Challenge
===================

## User Stories

```
As a user
So I can post as myself
I want to be able to sign up

As a user
So I can change my information
I want to be able to edit my profile

As a user 
So I can express myself
I want to be able to post a picture

As a user 
So I can express myself better
I want to be able to post a caption with my picture

As a user
So I can share my thoughts
I want to be able to comment on posts

As a user
So I can support my friends
I want to be able to like a post

As a user
So I can have a pleasant viewing experience
I want the website to be styled like Instagram
```

=======

## Instructions

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
group :development, :test do
  gem 'rubocop', '1.20', require: false
  gem 'rubocop-rails'
end
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
