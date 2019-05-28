Instagram Challenge
===================

## Progress/Status
I spent the first part of my weekend working on the Instagram challenge using Ruby on Rails. I only gave myself around 5-6 hours of Saturday to do this due to other commitments, but I was happy with the progress I had made. Taking a look at the commit history I can evidence that I have been able to install rails on an application, create controller routes, create databases using Postgres, add a number of gems such as devise and pg, generate user model. In addition, I added rubocop, simplecov and travis CI to assist with checking the program, for example travis will build the program before deploying to ensure there are no breaks/mistakes in the code. I made it so once travis has built the program and all tests pass, the app will automatically deploy to Heroku. I spent quite a bit of time on this as I wanted to use what I had learned during the Acebook challenge and put into practice to be able to integrate GitHub, travis and heroku. This furthered my learning of the developers workflow, using git to create new branches off master, pull request and merge. By practicing the workflow I am equipping myself for long term growth as this will eventually become second nature. I started to run out of time on the challenge as there was other topics that I wanted to study and improve my skills on, therefore I completed the set up for the rails application and added a sign up feature but decided to move on to study for my process review.  The challenge was good practice from what I had learned the previous week when working on the Acebook project. I will attempt to move forward and work on the instagram app when I have free time.

## Project set up approach

gem install rails -v 5.2.3.
brew install postgresql.

Tech Stack :
Backend-
Ruby 2.6.0. 
Rails 5.2.3. 
Database: Postgres. 

Create database:
rails db:create. 
rails db:migrate. 

Created database 'development_instagram'. 
Created database 'test_instagram'. 

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

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
