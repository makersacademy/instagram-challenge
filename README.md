AInstagram Challenge
===================

## Summary

AInstagram is a web application inspired by Instagram. Designed for busy developers who don't have time to think of usernames and passwords or to write comments on photos the app allows them to login with their GitHub accounts and post their photos. The app will automatically apply relevant comments based on the content of the photos using AI magic.

If the developers get bored of their photos they can apply filters to change the look.

## Technologies used

- Rails (Web framework)
- Postgreql (Database)
- Devise (User authentication)
- OmniAuth (GitHub API Authentication)
- AWS Rekognition (Photo analysis)
- ImageMagick (Photo manipulation)
- Bootstrap (Styling)
- RSpec/Capybara (TDD)
- Travis (CI)
- Heroku (CD)

## User Stories

As a busy developer
So I don't waste time logging in
I want to log in with my github account

As a busy developer
So I can show off my pictures
I want to upload them to the website

As a busy developer
So I don't have to waste time writing comments
I want my computer to automatically add appropriate comments

As a busy developer
If I realise I don't want a picture posted
I want to be able to delete it

As a bored developer
Now that I think my photo isn't exciting
I want to be able to change it with filters







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
