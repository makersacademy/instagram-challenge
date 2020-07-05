Instagram Challenge
===================

## Iitial goals

I'm starting this challenge very late. As such, I ahve some very simple goals that I want to achieve, even if I don't to complete any user stories.
1. Set up a rails project, with databases
2. Understand a bit more about the flow of control through the app, in particular through the config/routes.rb file

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!


### My Initial User Stories

```
As a user
So I can join in with all the fun
I want to be able to sign up to Instagram
```
```
As a user
To ensure security
Before I've signed up and signed in every page should redirect me to the sign-in page
```
```
As a user
So I can keep a record of what I've been up to
I can post pictures to Instagram
```

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
