Instagram Challenge
===================

Author: Emma Beynon

Github: https://github.com/emmabeynon

Email: emma.beynon@gmail.com


This is my submission for the Makers Academy Week 7 Weekend Challenge: https://github.com/makersacademy/instagram-challenge


Overview
---------

This week we have been tasked with building an Instagram clone using Ruby on Rails.
```
Your challenge is to build Instagram using Rails.
You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture.
Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
```

I created the following user stories based on the brief:

```
As a user
So that I can use Instagram
I would like to post pictures on it

As a user
So that I can post pictures on Instagram
I would like to create my own account

As a user
So that I can show that I posted a picture
I would like my username to be displayed with a picture I posted

As a user
So that I can share my thoughts on a picture
I would like to write a comment on a picture

As a user
So that I can show my appreciation for a picture
I would like to 'like' a picture

As a user
So that I can remove one of my posted pictures
I would like to delete a picture

As a user
So that I can change one of my posted pictures
I would like to edit a picture

As a user
So that I can see pictures posted by other users
I would like to see all users' pictures on the homepage

As a user
So that I can see one user's pictures
I would like to view all of a user's pictures on one page
```

Instructions
------------
* Fork this repo and clone to your local machine.
* Create the databases and migrate
```
$ bin/rake db:create
$ bin/rake db:migrate
```
* Launch the rails server
```
$ bin/rails s
```
* Navigate to `http://localhost:3000` in your browser.

Approach
---------
This project was test-driven using RSpec for the unit and controller tests, and RSpec/Capybara for the feature tests.  I made use of FactoryGirl to set up test objects for the tests, and Shoulda to provide appropriate matchers for the unit tests.  Additionally, I used DatabaseCleaner to empty the test database in between tests to ensure reliable results.  File attachment functionality was provided by Paperclip.  I also made use of Bootstrap for styling purposes.

Screenshots
------------
Signed out
![signed out](http://i.imgur.com/ulDBVSn.png)

Signed in
![signed in](http://i.imgur.com/cagVQPh.png)

Posting a picture
![Post picture](http://i.imgur.com/d1MPQ6f.png)

Further Work
-------------
* Outstanding issue with likes not pluralising correctly unless you refresh the page
* View all of a user's pictures on one page
* Linked hashtags
* Display when the picture was posted
* Users can only like a picture once
* Allow users to delete their comments
* Host images on S3
* Deploy to Heroku
