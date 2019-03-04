Deployed [here](https://schminstagram.herokuapp.com/)!!

Log in as bob@bob.com with password bbbbbbb, or sign up.

Designed in a style I call 'beautifugly'.

## problems encountered

Can't get Capybara to click the 'sign out' button/link.

Don't know what the preferred/conventional way to prepare info for a view is (skinny controllers, sure, but what exactly am I meant to do in the model)

Didn't have enough time to do all the features, let alone test driving and writing a readme

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## MVP user stories

```
As a user
So that I can access data relevant to me
I want to be able to sign in

As a user
So that I can secure my data
I want to be able to sign out

As a user
So that I can keep up with the world
I want to view others' posts with pictures in the app

As a user
So that I can feel social
I want to share posts in the app

As a user
So that I can revert mistakes
I want to be able to delete posts

As a user
So that I can curate my brand
I want to have a profile page showing only posts by me
```

## Task breakdown and estimation (in fibonnaci story points)

### Phase 1: starting Saturday 12.30. Total: 13 story points. Took 6 hours.

Initialize rails project - 2

Use devise gem to generate user relation and functions - 3

Spike remaining database relations - 2 - this took much longer than expected. FInished by 16.40 Saturday.

Write tests for database relationships - 2

Set up Travis via Github - 2 - easier than expected

Deploy on Heroku - 2 - this was much harder than expected

### Phase 2: starting Sunday 16.00. Total: N story points. Took N hours.



### Further stories

```
As a user
So that I can interact with posts
I want to comment on posts

As a user
So that I can understand my audience
I want to see the comments on posts, with the names of the poster linked to their profile

As a user
So that I can revert mistakes
I want to be able to delete comments

As a user
So that I can show appreciation
I want to be able to 'like' posts

As a user
So that I can feel encouraged by my friends
I want to be able to see who has liked my posts
I want to be able to see how many people have liked each post

As a user
So that I can revert mistakes
I want to be able to 'unlike' posts

As a user
So that I can curate my feed
I want to be able to follow and unfollow other accounts

As a user
So that I can build my following and reputation
I want my profile to display my followers and the number of them
```

## To migrate database locally

```bash
> rake db:create
> rake db:migrate
> rake db:seed
```

## To migrate database on Heroku terminal

```bash
> rake db:schema:load -a [name of your app]
> rake db:migrate -a [name of your app]
> rake db:seed -a [name of your app]
```

## Database schema

Relations (tables):

Users Follows Posts Resources Comments Likes

Users have many Follows
Users have many Posts
a Post has one attached Image (in ActiveStorage)
Posts and Users have many Comments
Posts and Users have many Likes

(All relations include time of creation and of updating)

__Users__
id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, (from here on not auto-generated) username, first_name, last_name, profile_pic

__Follows__
id, user_id, followed_user_id

__Posts__
id, user_id

__Comments__
id, post_id, user_id, message

__Likes__
id, post_id, user_id

# Instagram Challenge

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
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
