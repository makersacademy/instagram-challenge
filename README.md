# README
This is my on weekend's work on a clone of Instagram.
Installation:
```
git clone https://github.com/anaalta/instagram-challenge
bundle install
bin/rails server
```

Open http://localhost:3000/ and you can create an account, add pictures, comment on pictures, upvote or downvote a picture.  

I produced the following user stories:
```
As a user,
So I can post pictures,
I want to be able to create and account on Instagram.

As a user,
So I can post pictures,
I want to be able to log in and out of Instagram.

As a user,
So I can use the app,
I want to be able to post pictures from my computer.

As a user,
For privacy,
I want pictures to be visible only to those who are signed in.

As a user,
To rate pictures,
I want to be able upvote or downvote them.

As a user,
So I can react to pictures,
I want to be able to leave a comment under a picture
```

* Ruby version - 2.4.0
  Rails - 5.1.1
* Testing frameworks: Rspec/Capybara for feature tests.
* System dependencies
I used Devise gem to create an account, log in and log out users.
I used Paperclip gem to upload photos.
I used acts_as_votable to add upvote/downvote functionality.
* ActiveRecord as ORM and Sqlite3 for database management 
