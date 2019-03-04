[![Build Status](https://travis-ci.org/thielsen/instagram-challenge.svg?branch=master)](https://travis-ci.org/thielsen/instagram-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/7258f325b151a1e93d8b/maintainability)](https://codeclimate.com/github/thielsen/instagram-challenge/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/7258f325b151a1e93d8b/test_coverage)](https://codeclimate.com/github/thielsen/instagram-challenge/test_coverage)

AInstagram
===================

## Summary

AInstagram is a web application inspired by Instagram. Designed for busy developers who don't have time to think of usernames and passwords or to write comments on photos the app allows them to login with their GitHub accounts and post their photos. The app will automatically apply relevant comments based on the content of the photos using AI magic.

If the developers get bored of their photos they can apply filters to change the look.

## Production environment

The application is deployed to Heroku at https://ai-nstagram.herokuapp.com. As theres no persistent storage on Heroku you might see empty images so feel free to upload some to try out. I'm not going to use Amazon S3 for this as I've only got limited space there...

## Technologies used

- Rails (Web framework)
- Postgreql (Database)
- Devise (User authentication)
- OmniAuth (GitHub API Authentication)
- AWS Rekognition (Photo analysis)
- ImageMagick (Photo manipulation)
- Bootstrap (Styling)
- RSpec/Capybara (TDD)
- Travis (CI)
- Heroku (CD)

## User Stories

```
As a busy developer
So I don't waste time logging in
I want to log in with my github account
```
```
As a busy developer
So I can show off my pictures
I want to upload them to the website
```
```
As a busy developer
So I don't have to waste time writing comments
I want my computer to automatically add appropriate comments
```
```
As a busy developer
If I realise I don't want a picture posted
I want to be able to delete it
```
```
As a bored developer
Now that I think my photo isn't exciting
I want to be able to change it with filters
```
## Database design

![alt text](https://github.com/thielsen/instagram-challenge/blob/master/dbdesign.png "")

## Installation

To install a development environment

```
clone this repo
> bundle install
> brew install imagemagick (assuming you are on a Mac)
> bin/rails db:create
> bin/rails db:migrate
```
API keys are needed for AWS and GitHub. Configuration here is beyone the scope of this document but instructions for each are here:

- https://docs.aws.amazon.com/rekognition/latest/dg/getting-started.html
- https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/

Once the keys have been setup on your local machine:

```
EDITOR=vi bin/rails credentials:edit
```

And add the following to the credentials file:

```
development:
  github:
    client_id: <id>
    client_secret: <secret>
  aws:
    access_key: <key>
    secret_access_key: <key>
```

If you intend to run the application in CI and production deployment you should also add the equivalent for test: and production:

Finally:

```
> bundle exec rspec # Confirm all green
> bin/rails server
```

And connect to the application on https://localhost:3000

## Using the App

Login with your GitHub account. Once logged in click 'New Post' to add an image. It will appear and have relevant hashtags applied:

![alt text](https://github.com/thielsen/instagram-challenge/blob/master/hashtag.png "")

Click on an images to apply filter to it:

![alt text](https://github.com/thielsen/instagram-challenge/blob/master/filters.png "")











---------------------------------------------------------------------

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
