Instagram Challenge
===================

How to run
-----------
Clone the repo, install the gems, set up the database and run it locally.
```
$ git clone git@github.com:stephengeller/instagram-challenge.git
$ cd instagram-challenge
$ bundle install
$ rake db:migrate
$ rails s
```


Features
--------
  - Can sign up, log in and out with validations
  - Can upload a picture and post it to a 'newsfeed' with a caption
  - Users can 'like' or 'unlike' posts, and leave comments that can also be deleted
  - Users can visit their profile to see snaps they've uploaded


Technology
---------
  - Built using Ruby on Rails
  - Clearance gem (for user management)
  - acts_as_votable for voting on posts
  - Rspec / Capybara for testing

To Do
-----
  - Visit someone else's profile and see their snaps
  - Add more user details (currently only email and password)
  - Add an Instagram-style grid display for profiles
