Pinstagram
===================

## User Stories
```
As a user
So I can access my profile
I would like to be able to log in to Pinstagram

As a user
So only I can post on my account
I would like to be able to set a password on my account

As a user
So I can share pictures with my friends
I would like to upload a picture to my account

As a user
So I can alert my friends I have seen their pictures
I would like to be able to leave a like

As a user
So I can respond to a friend's pinstagram post
I would like to be able to leave a comment

As a user
So I can monitor my personal brand
I would like to be able to delete my own pinstagram posts

As a user
So I can perfect my captions
I would like to be able to edit the captions of my own posts

As a user
So I can backpedal on my sentiments
I would like to be able to delete my own comments

As a user
So I can see all my friend's posts in one place
I would like to be able to visit the homepage

As a user
So I can see all my posts in one place
I would like to be able to visit my Profile page

As a user
So I can see all the posts of a particular friend in one place
I would like to be able to visit their profile page

As a user
So I can add context to my pictures
I would like to be able to add a description to each post

---

As a product owner
So the focus stays on the images
I want it to be compulsory to attach a picture to each post
Even in the absence of a description

As a product owner
So the site is appealing to users
I would like it to be stylish yet understated

As a product owner
In order to protect free speech
I would like to prevents users from deleting others' comments on others' posts

As a product owner
To ensure a smooth user experience
I want the site to have smooth navigation
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
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!

## steps

```
yarn install --check-files
bundle
rails db:create
rails db:migrate

bundle exec rspec
rubocop
```
