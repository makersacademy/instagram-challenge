
Anthony's Instagram Challenge
===================

## Introduction

My attempt at the week 8 Instagram challenge in Rails, HTML, CSS and JS. 

## Setting up

Clone the repo
* `git clone https://github.com/AJOsmaston/instagram-challenge.git`

Navigate to the project folder
* `cd instagram-challenge/igchallenge`

Install dependencies
* `bundle install`

Set up the databases required
* `rails db:create`
* `rails db:migrate`

For testing suite:
* `rspec`

For code quality:
* `rubocop`

To start the server
* `rails server`
* `http://localhost:3000/`

User stories:

```
As a new user,
so that I can start to use IG
I would like to be able to register

As an existing user
so that I can start to post
I would like to be able to log in

As an existing user
so that I can keep my account secure
I would like to be able to log out

As a signed in user,
so that I can show off my pictures
I'd like to be able to upload a picture

As a signed in user
so that my picture can have some depth
I'd like to be able to give it a description

As a signed in user
so that I can gloat about my lovely life
I'd like everyone to be able to see my picture

As a signed in user
so that everyone knows it's my picture
I'd like to have my name displayed against it
```

## Breakdown of this challenge

So far, I have implemented the features described in the user stories above. I am quite happy with my progress here - I tried to do everything manually (no scaffolding, only generating models for database connections and minimal gem help [e.g. not using devise]). I have started to play around with bootstrap as well, which has given my project less of a 2000s website feel.

If I had more time, I would work on adding likes to the pictures, then I would work on adding comments. After this point, I think I would look at optimising what I have got and making sure that the features that exists are exhaustitively bug tested. 


## Makers TASK:

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
