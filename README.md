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

Installation Instructions
------------------------------------------------------------------------
Clone from github and move into directory. Install dependencies by running
bundle.

$ git clone git@github.com:danielagaleote/instagram-challenge.git
$ cd instagram-challenge
$ bundle

Create the database and carry out migrations
$ bin/rake db:create
$ bin/rake db:migrate

Run the app
$ bin/rails s

Open the app at http://localhost:3000/ 

User stories
------------------------------------------------------------------------
As a user so that I can share my life with my friends, I want to
be able to upload photos

As a user to protect me from my clumsiness, I want to be able to
edit and delete the photos that I have uploaded

As a user for social validation, I want my friends to be able
to view my photos

As a user to protect my property, I want to be the only one able
to delete my photos

As a user to protect my property, I want to be the only one able
to edit my photos

As the web owner to protect user's privacy I want user to have to
sign in before viewing photos

As a user to make sign up faster, I want to be able to sign in using
email or through facebook
