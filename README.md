Setup

Clone this repo
Install Postgresql $ brew install postgresql
Install ImageMagick $ brew install imagemagik
Install gems $ bundle install
Create your database $ rake db:create
Migrate your database $ rake db:migrate
Usage

Launch the app with rails $ rails s
Open the app in your browser at http://localhost:3000
Tests

If not already created, create test databases $ rake db:create RAILS_ENV=test
If you had to create the database, migrate it $ rake db:migrate RAILS_ENV=test
Install PhantomJS $ brew install phantomjs
Run the tests using $ rspec
User Stories
The user stories I worked from are below.

As a user, So I can view people's pictures I want to be able to sign up

As a user, So I can make people jealous of my lifestyle I want to be able to upload pictures

As a user, So I can prevent embarrassment, I want to be able to delete pictures

As a user, So I can let other users know what I think of their life, I want to be able to leave comments on their pictures

As a service provider, To protect my users's privacy, I want to prevent non users from viewing users pictures.

As a user, So I don't have to use my words to express my appreciation of others pictures, I'd want to be able to 'like' other users pictures

Further improvements
There are a number of features I would like to implement in future.

Filters, to search posts by tags.
Time stamps on posts to show how long ago they were posted.
OAuth log in.
Comment form for images on the pictures page so no need to leave the page.
Enhance the styling.
Original README
The original README we received when the challenge was proposed is list below as presented.

Instagram Challenge
Instructions

Challenge time: Friday, the entire day + the weekend if you need it
Feel free to use Google, your notes, books, etc., but work on your own
If you refer to the solution of another coach or student, please put a link to that in your README
If you have a partial solution, still check in a partial solution
You must submit a pull request to this repo with your code by 9am Monday morning
Task

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by

Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
Forking this repo. After cloning your fork and cd'ing into it, you'll need to initialize a Rails app in the current directory.
Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
