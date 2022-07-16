Instagram Challenge
===================

## Instructions

* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## User Stories

Users

As an amateur photographer
So that I am remembered on the site
I would like to be able to sign up

As an amateur photographer
So that I can access my accounts
I would like to be able to sign in

As an amateur photographer
So that people cannot post photos as me
I would like to be able to log out

Posts

As an amateur photographer
So that I can share my work
I would like to be able to post an image on instagram

As an amateur photographer
So that I get credit for my photos
I would like my username to appear next to my photo

As an amateur photographer
So that I can avoid being embarrassed by old work
I would like to be able to delete my photos

As a photography fan
So that I can see what is happening now
I would like to see the most recent post first


Comments

As an amateur photographer
So that I can get feedback
I would like people to be able to comment on my work

As an amateur photographer
So that I get fewer rude comments
I would like to see the username of the person who posts a comment

Likes:

As a photography fan
So that I can show my appreciation
I would like to be able to like a photo

As a photography fan
So that I know what is truly popular
I want users to only be able to like a photo once

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
