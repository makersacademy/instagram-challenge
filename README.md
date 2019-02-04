Instagram Challenge
===================


My attemp at Makers Academys Instagram Challenge. For a full description of the challenge, see 'APPENDIX' below.

Instructions for users
Note that you will need postgreSQL installed.

```
$ git clone github.com:jaywayawyaj/instagram-challenge.git 
Navigate to instagram-challenge 
$ bundle 
$ createdb outstagram_development - creates a database 
$ createdb outstagram_test- creates a database specifically for testing 
$ rake db:migrate - creates tables in your development 
$ rackup Visit 'http://localhost:3000/' in a web browser
```

## Usage

Technologies used:

Ruby
Rails
PostgreSQL
ActiveRecord

For Testing:

RSpec Capybara

Running tests:

Run rspec

93.85% test coverage.

Linter: 
Rubocop

5 Offences

### Notes

Spent some time but not loads on the challenge. Nice functionality with homepage showing different content when you're logged in or not, profile page showing all of signed in users posts. 
Mostly followed a TDD process (features, not units), but I threw in a little functionality at the end which I didn't test drive as I couldn't work out why one feature was failing for way too long and got frustrated.
I would like to return to this project to add CSS, and also to make everything a little smoother - I didn't put much attention to detail in this weekend as I timeboxed the challenge for the weekend.

## Initial User Stories

```
As an Outstagramme wannabe,
So that I can get involved,
I want to be able to sign up for an Outstagram account.


As an Outstagrammer,
So that I can make new posts,
I want to be able to log in of the service.


As an Outstagrammer,
So that I can maintain some privacy,
I want to be able to log out of the service.

As an Outstagrammer,
So that I can share my content,
I want to be able to post a picture to Outstagram.

As an Outstagrammer,
So that I can give my posts connect,
I want to be able to write a description with my picture.

As an Outstagrammer,
So that others can get an overview of my content,
I want all my posts displayed as thumbnails on my profile.

As an Outstagrammer,
So that others can see my posts in detail,
I want the thumbnails to link to the full post.

As an Outstagrammer,
So that I can engage in discussion,
I want to be able to comment on other OG’s posts.

As an Outstagrammer,
So that I can see the popularity of my posts,
I want to be able to have my posts liked.
```

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
