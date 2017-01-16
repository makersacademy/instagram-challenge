# Instagram Challenge

###Objective
The aim of this project is to create a simple instagram clone that allows users to post photos, comment and like photos

###MVP User Stories

```
As a user,
So that I can share my photos with others
I want to post a picture

As a user,
So that I can share my thoughts on a photo with others
I want to post a comment

As a user,
So that I can share my appreciation on a photo with others
I want to like a picture

As a user,
So that I can see photos others have shared
I want to view pictures

As a user,
So that I can see comments against photos others have shared
I want to view comments

As a user,
So that I can see appreciations for photos others have shared
I want to view likes

As a user,
So that no one can pretend they are me
I want to be able to sign up for my own account

As a user,
So that no one can use my account without my permission
I want to be able to sign out of my account

As a user,
So that I can start using the site
I want to be able to register for an account

As a user,
So that no one can tamper with my posts
I want to be the only one who can delete a post
```

###Additional User Stories (to be implemented)
```
As a user,
So that no one can tamper with my posts
I want to be the only one who can edit a post

As a user,
So that I can rectify a mistake
I want to be able to un-like a post I have previously liked

As a user,
So that I can avoid a lengthy registration process
I want to be able to log in with facebook

As a user,
So that my posts aren't spammed
I want to be able to limit users to one 'like'
```

###Outstanding Steps
* Deploy on Heroku
* Store images on AWS

###Installation
1. Fork this repository
2. Run `bundle install` to get all required gems
3. `brew install phantomjs` to ensure JavaScript tests can be run
4. Run `rake db:create` to create required databases
5. Run `rake db:migrate` to ensure databases are properly set up
6. If you would like to run in Production, navigate in your browser to `http://instagramdenee.herokuapp.com/`

###How to Use
1. Run command `rails s` in command line to open web app locally
2. Visit `localhost:3000` to get browsing
3. Users can sign up / register using links on the right in order to use the app
4. Click 'Post a new photo' to add a post
5. Click the heart icon to 'like' a post
6. Click 'Sign Out' to sign out at any point

###Technologies
* Ruby on Rails
* PostgreSQL
* RSpec
* Capybara
* JavaScript
* Poltergeist, for JavaScript browser testing
* HTML & CSS
