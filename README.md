Instagram Challenge
===================

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## Implementation

I have used a rails API backend with, rspec for testing and webpacker to load React as the frontend for the app. 
I aimed to implement basic functionality for a user (signup, login, viewing posts) and tried to implement it in the simplest way possible.
This made it easier to debug and learn rails and react.

The following gems were used for testing the rails API:
- Rspec, runs tests
- factory_bot_rails, to automate the creation of fake data
- shoulda-matchers, provides additional matchers for Rspec in rails
- faker, provides randomly generated names, usernames, emails and password (sometimes broke my tests due to special characters)
- database_cleaner, cleans the database after each suite

The following packages were used with React:
- bootstrap, for styling front-end components - bootstrap classes
- jquery and popper.js, required for bootstrap
- react-router-dom, handles navigation in a React application

## Instructions

- Clone the repo
- run `bundle install`
- run `npm install`
- run `rails db:create db:migrate db:seed`
- To run tests run `rspec` while at the root directory
- To run the server run `rails s`
- Server will start at `http://localhost:3000/`

- A user with predefined username (taran314) and password (password123) is created with posts.
- You can also create a new user and log in, but the ability to create new posts has not been implemented.

TODO
------

- [x] Create models and controllers for Users and Posts
- [x] Create homepage with login form
- [x] Create signup page with form
- [x] TDD rails API for Users and Posts
- [x] Users can sign up
- [x] Users can login
- [x] Users can logout
- [x] Users can view their posts
- [ ] Users can view each post
- [ ] Users can view other user's posts (on a seperate page after logging in - search for other users )
- [ ] Create form on posts page to create a new post
- [ ] Users can create new posts
- [ ] Improve how sessions are handled on server side
- [ ] Encrypt users passwords
- [ ] Comments
- [ ] Likes
