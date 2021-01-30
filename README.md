Instagram Challenge
===================

# Will's Readme

## How to Run

### Setup
- Clone the repository locally
- `cd instagram-challenge`
- `bundle install`
- `rake db:setup`

### Launch
- Run `rails s` in the terminal
- Navigate to `http://localhost:3000/` in the browser

### To Run Unit Tests
`rake test`

### To Run Feature Tests
`rake test:system`
Note - you may be prompted to install Chrome Webdiver. If so, visit.
Mac users with Homebrew installed can simply run `brew install --cask chromedriver`. You may need to give your Mac permission to open the relevant file when prompted.
If not, then see this post: https://stackoverflow.com/questions/19862276/unable-to-find-the-chromedriver-executable

## Planning

### Spec

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

### User Stories

```
As a user
So that I can have my own account
I want to sign-up for Binstagram

As a user
So that I can browse as myself
I want to sign-in to Binstagram

As a user
So that I can keep my account secure
I want to be able to sign-out of Binstagram

As a user
So that I can share my favourite bin moments
I want to post a picture to Binstagram

As a user
So that I can see my own posts and others
I want to see who posted each picture

As a user
So that I share my vast bin knowledge
I want to make a comment on any picture

As a user
So that I share show my respects to others' bins
I want to be able to like their bin photos

As a user
So that I have pleasant experience viewing bins
I wouldn't mind a bit of front-end styling

As a user
So that I can make my bin look vintage ('bintage')
I would like to filter my images before posting
```

### Initial Mock-up

![mock-up](https://github.com/Will-Helliwell/instagram-challenge/blob/master/Screenshot%202021-01-30%20at%2009.07.17.png
)

## Workflow

### Currently working on

User can post a bin photo - have created form and inserts new post into database.
Need to display on users personal feed. Need to associate posts with users.

###Still to do

Basic admin:
- Get rubocop working
- Get simplecov working

Testing:
- Understand and follow best practice for controller tests

Sign-up:
- Use BCrypt to encrypt passwords
- Checks - cannot sign-up with pre-existing username and/or email. Double-layered checks (Database-level - use Active record validations + check in users controller - gives Sinatra flash message if failed).
- Log-out
- Log-in



# Makers Readme

## Instructions

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
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
