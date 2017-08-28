Instagram Challenge
===================

## About

An instagram clone built using Rails and tested with Rspec. Users can post pictures, write comments on pictures and like a picture.

User management is implemented with Devise and pictures are uploaded to Amazon S3 by Paperclip. The app is hosted by Heroku and can be viewed here:

https://bensinstagram.herokuapp.com/

## How to use

Heroku at the link above or to run locally:

git clone https://github.com/BDCraven/instagram-challenge.git
bundle install
rails db:migrate
rails server

Visit 'localhost:3000'

Further development options
---------

* add user name to comments

* use AJAX to update likes and comments rather than refreshing the page

* allow comments to be made in Profile page

* improve CSS styling

* add search functionality  

* add default landing page to be shown when no user is logged in
