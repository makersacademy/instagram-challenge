##Setup

Clone this repo
Install Postgresql $ brew install postgresql

Install ImageMagick $ brew install imagemagik

Install gems $ bundle install

Create your database $ rake db:create

Migrate your database $ rake db:migrate

##Usage

Launch the app with rails $ rails s

Open the app in your browser at http://localhost:3000
Tests

If not already created, create test databases $ rake db:create RAILS_ENV=test

If you had to create the database, migrate it $ rake db:migrate RAILS_ENV=test

Install PhantomJS $ brew install phantomjs

Run the tests using $ rspec

##User Stories
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


