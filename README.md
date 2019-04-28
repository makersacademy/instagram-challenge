Instagram Challenge
===================

## Instructions

* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!



## Setup instructions 
- Run bundle
- Run 'rails s' to start server
- To run tests: run rspec in directory





# Approach
## User stories

### Part 1
- user can sign up

test: signed up interface with details appear after signed up

- user can sign in

test: signed up interface with details appear after sign in

- user can sign out

test: message signed out


Posting:
- user can post pictures, when signed in

test: feature test that post is visible after posted


- user can write comments on pictures (any pictures), when signed in

first run migrations for pictures
test: feature test that comments appear after posted


- user can like a picture, when signed in

test: feature test that like increases after click is made by user

- user can like a picture, when signed in
test (feature): 



## Steps
1. Diagramic modelling
- created user model, with devise



- created post model (which uploads picture)
beleongs to user


- created comment model
beleongs to user, post


- created like model 
beleongs to user, post

2. Implemented testing of above user stories




3. Access control 
(only signed in users can post image, comment, like), or it gives an error)
- devise before 

Navbar:
- when signed out: sign in and sign up available

- when signed in: sign out availabe






## What I didn't do (yet)
- have error message shown if clicking on upload your image when no file is attached.
- acecess control 

- same user cannot like a post more than once





## Code quality and test coverage
- used rubocop --a

- used simpleCov, excluded some files







## Extra Makers instructions
## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
