[![Build Status](https://travis-ci.org/michaellennox/instagram-challenge.svg?branch=master)](https://travis-ci.org/michaellennox/instagram-challenge)

#Instagram Challenge

This is my solution for the [Instagram Challenge](https://github.com/michaellennox/instagram-challenge/blob/master/MAKERS_README.md) carried out at the end of my seventh week at Makers' Academy. It's a basic instagram clone built in rails.

##How I worked

I aimed to complete this challenge in a test driven manner. I wrote automated integration tests with RSpec/Capybara to represent user actions through the application, automated functional tests for my controllers with RSpec and automated unit tests for the models. I have made use of various additional library including FactoryGirl, Warden, DatabaseCleaner, Devise and Shoulda to provide additional functionality to my test suites.

##Installation Instructions

Clone down from github and cd into the directory

```
$ git clone git@github.com:michaellennox/instagram-challenge.git
$ cd instagram-challenge
```

Create the database and carry out migrations

```
$ bin/rake db:create
$ bin/rake db:migrate
```

Run the app

```
$ bin/rails s
```

Visit `http://localhost:3000/` and enjoy the beauty that is NotInstagram

##Usage Instructions

When you visit NotInstagram you will see something like follows:

[NotInstagramHomescreen](http://i.imgur.com/iRTAjzp.png)

* You can sign up for the service via sign up or if you already have an account press sign in.
* Create a new post via the Create Post button.
* Like an existing post with the Like! button.
* See all comments on a post by pressing the picture.
* Leave a comment by pressing Create Comment.

##Brief

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

##Future Improvements

* Extend the controllers to allow more actions (particularly on comments)
* Add the ability to like comments
* Display the top comment for each photo on the front page
* Order posts by total likes
* Add validations (there's currently almost none of these) to models
* Extend feature specs to follow more user journeys and to avoid making use of Warden
* Work out why js: true is ruining asset routing and crashing my tests. For now I'm stuck with just redirecting when you like instead of responding with JSON.
* Neaten up controller specs
* Deploy to Heroku
* Set paperclip to host images on S3
* Work out how you're meant to write an instagram clone in a single weekend
