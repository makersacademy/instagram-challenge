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

### Use
- Sign-up with a username, email (do not use your real one!) and password.
- Follow the link to post your bin, entering the image url when prompted (you can host your image on Imgur if needed - https://imgur.com/)

### To Run Unit Tests
`rake test`

### To Run Feature Tests
`rake test:system`

Note - you may be prompted to install Chrome Webdiver. If so, visit https://chromedriver.chromium.org/downloads.

Mac users with Homebrew installed can simply run `brew install --cask chromedriver`. You may need to give your Mac permission to open the relevant file when prompted.
If not, then see this post for more details: https://stackoverflow.com/questions/19862276/unable-to-find-the-chromedriver-executable

## Planning and Work So Far

### Spec

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

### Initial Mock-up

![mock-up](https://github.com/Will-Helliwell/instagram-challenge/blob/master/Screenshot%202021-01-30%20at%2009.07.17.png
)

### User Stories

```
As a user
So that I can have my own account
I want to sign-up for Binstagram
```
Completed:
- A single user can sign up with a username, email, password, which automatically signs them in
- This takes the user to their own personal feed (/users/:username)

Still to do:
- Use BCrypt to encrypt passwords
- Checks - cannot sign-up with pre-existing username and/or email. Double-layered checks (Database-level - use Active record validations + check in users controller - gives Sinatra flash message if failed).

```
As a user
So that I can browse as myself
I want to sign-in to Binstagram

As a user
So that I can keep my account secure
I want to be able to sign-out of Binstagram

As a user
So that I can share my favourite bin moments
I want to post a picture to Binstagram
```
Completed:
- Signed-in user can post images of their bins by entering the image URL. These appear in reverse chronological order on the feed.

Still to do:
- Ability to add a caption to each post
- More user-friendly image input - option to upload an image from their local storage

```
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

## Non-User Story Tasks still to do

Basic admin:
- Get rubocop working
- Get simplecov working

Testing:
- Understand and follow best practice for controller tests

## Decisions Made

Back-end:
- Don’t use devise, just create login/logout manually (too steep a learning curve for the time available)
- Use /users/:username as each user’s personal url page (instead of one single URL e.g. /feed). Don’t yet have enough knowledge to know which is the better choice, but chose this because it differs from what we have been implementing as a group during the week.

Front-end:
- plan to use jquery to manipulate the DOM where necessary (mostly /users/:username). Not using React (too steep a learning curve for the time available)
- Attempt bootstrap for styling


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
