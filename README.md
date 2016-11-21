#Instagram clone challenge

This is my solution to the Makers Academy Week 7 weekend challenge, which was to make a clone of instagram. Week 7 of Makers Academy is all about learning Rails, so naturally this project is made using the Rails framework.

It's test driven, using RSpec and Capybara, with Poltergeist as a driver for those tests including Javascript.

Is uses Postgresql for the database, but in the production environment is uses AWS S3 for serving images.

It looks like the below screenshot, and is hosted on Heroku [here:](https://instawynne.herokuapp.com/)

![screenshot](http://i.imgur.com/zRBiuFk.jpg)

## Setup
0. Clone this repo
0. Install Postgresql ```$ brew install postgresql```
0. Install ImageMagick ```$ brew install imagemagik```
0. Install gems ```$ bundle install```
0. Create your database ```$ rake db:create```
0. Migrate your database ```$ rake db:migrate```

## Usage
0. Launch the app with rails ```$ rails s```
0. Open the app in your browser at ```http://localhost:3000```

## Tests
0. If not already created, create test databases ```$ rake db:create RAILS_ENV=test```
0. If you had to create the database, migrate it ```$ rake db:migrate RAILS_ENV=test```
0. Install PhantomJS  ```$ brew install phantomjs```
0. Run the tests using ```$ rspec```

# User Stories

The user stories I worked from are below.

As a user,
So I can view people's pictures
I want to be able to sign up

As a user,
So I can make people jealous of my lifestyle
I want to be able to upload pictures

As a user,
So I can prevent embarrassment,
I want to be able to delete pictures


As a user,
So I can let other users know what I think of their life,
I want to be able to leave comments on their pictures

As a service provider,
To protect my users's privacy,
I want to prevent non users from viewing users pictures.

As a user,
So I don't have to use my words to express my appreciation of others pictures,
I'd want to be able to 'like' other users pictures

#Further improvements

There are a number of features I would like to implement in future.

0. Filters, to search posts by tags.
0. Time stamps on posts to show how long ago they were posted.
0. OAuth log in.
0. Comment form for images on the pictures page so no need to leave the page.
0. Enhance the styling.

#Original README

The original README we received when the challenge was proposed is list below as presented.



Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
