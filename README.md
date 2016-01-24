[![Build Status](https://travis-ci.org/michaellennox/instagram-challenge.svg?branch=master)](https://travis-ci.org/michaellennox/instagram-challenge)

#Instagram Challenge

This is my solution for the [Instagram Challenge](https://github.com/michaellennox/instagram-challenge/blob/master/MAKERS_README.md) carried out at the end of my seventh week at Makers' Academy. It's a basic instagram clone built in rails.

##How I worked

I aimed to complete this challenge in a test driven manner. I wrote automated integration tests with RSpec/Capybara to represent user actions through the application, automated functional tests for my controllers with RSpec and automated unit tests for the models. I have made use of various additional library including FactoryGirl, Warden, DatabaseCleaner, Devise and Shoulda to provide additional functionality to my test suites.

##Installation Instructions

TBD

##Usage Instructions

TBD

##Brief

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

##Future Improvements

* Add styling to the site
* Extend the controllers to allow more actions (particularly on comments)
* Add the ability to like comments
* Add validations (there's currently almost none of these) to models
* Extend feature specs to follow more user journeys and to avoid making use of Warden
* Neaten up controller specs
* Deploy to Heroku
* Set paperclip to host images on S3
* Work out how you're meant to write an instagram clone in a single weekend
