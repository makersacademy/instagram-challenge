Instagram Challenge
===================

[![AJ8GH](https://circleci.com/gh/AJ8GH/instagram-challenge.svg?style=shield)](https://app.circleci.com/pipelines/github/AJ8GH/instagram-challenge)

## Ruby version
  * 2.7.2

## System dependencies

* **Gems:**
```
bootsnap (>= 1.4.4)
byebug
capybara (>= 3.26)
factory_bot_rails
jbuilder (~> 2.7)
listen (~> 3.3)
pg (~> 1.1)
puma (~> 5.0)
rack-mini-profiler (~> 2.0)
rails (~> 6.1.3, >= 6.1.3.1)
rspec-rails (= 4.0)
rubocop-rails
sass-rails (>= 6)
selenium-webdriver
spring
turbolinks (~> 5)
tzinfo-data
web-console (>= 4.1.0)
webdrivers
webpacker (~> 5.0)
```

* **Node Modules:**
```
"@rails/actioncable": "^6.0.0",
"@rails/activestorage": "^6.0.0",
"@rails/ujs": "^6.0.0",
"@rails/webpacker": "5.2.1",
"turbolinks": "^5.2.0"
"webpack-dev-server": "^3.11.2"
```

## Getting started

* Install ruby 2.7.2
* Install node and npm
* Clone this repository

```shell
git clone git@github.com:AJ8GH/instagram-challenge.git
```

* Install dependencies

```shell
cd instagram-challenge
bundle install
npm install
```

## Database setup:

* Database creation
```shell
rake db:create
```

* Database initialization
```shell
rake db:migrate
```

## Usage

* Start Rails server

```shell
rails s
```

* Go to [local host 3000](http://localhost:3000/) to use the app


## How to run the test suite

```shell
bundle exec rspec
```

or:
```shell
bundle exec rake
```

for documentation format:
```shell
bundle exec rspec -fd
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## User stories

### Complete
```
As a user,
I would like to see posts on the home page,
So I can easily see my network's posts.

As a user,
I want to be able to post photos,
So that I can share my best images

As a user,
I want to caption my posts,
So that I can add context to an image.

As a user,
I want the posts to appear in reverse chronological order,
So I am always seeing the latest posts first.

As a user,
I want to be able to edit my account details,
So that I can fix mistakes or change out of date info.

As a user,
I want to be able to delete my account,
So that I can leave instagram and remove all of my posts.

As a user,
I would like to be able to sign up for Instagram,
So I can build a portfolio of posts.

As a user,
I want to be able to sign in,
So that I can access my account and posts.

As a user,
I want to be able to sign out,
So that others can't access my account.

As a user,
I want to see the user name of each post,
So I know who posted what.

As a user,
I want to be able to edit my posts,
So that I can fix mistakes without having to start again.
```

### Pending
```
As a user,
I want users to only be able to edit their own posts,
So that my posts are not edited by anyone but me.

As a user,
I want users to only be able to edit their own posts,
So that my posts are not edited by anyone but me.

As a user,
I want users to only be able to edit their own posts,
So that my posts are not edited by anyone but me.

As a user,
I want users to only be able to delete their own posts,
So that my posts are not deleted by anyone but me.

As a user,
I want to be able to delete posts,
So that I can remove photos I no longer like

As a user,
I want to see the time and date of each post,
So I know when it was posted.

As an admin,
I want users to not see posts and be redirected to the sign up page when not logged in,
To protect the privacy of our users.

As an admin,
I want all posts to include an image or video,
So that Instagram is known for photo and video sharing.

As a user,
I want to be able to add filters to my posts,
So that I can add effects to my photos.

As a user,
I want to be able to follow other users,
So that I can keep up to date with my favourite posters.

As a user,
I want to be able to like posts,
So that I can share my appreciation for great photos.

As a user,
I want to be able to comment on posts,
So that I can share my thoughts about interesting photos.
```
