## User stories

As a Public User
So that I can create an account
I want to be able to sign up

As a Registered User
So that I can post images
I want to be able to log in

As a Registered User
So that I can upload my holiday photos
I want to be able to post images

As a Registered User
So that I can comment on my friend's pictures
I want to be able to add comments to a post


## Process

I spent the morning doing research and looking at Rails tutorials around similar projects to create a list of gems that I think would work well (see Gem List).

I then proceeded to set up my project. Unfortunately this took me several attempts as I kept making mistakes and not knowing how to resolve the issues.

  - I kept creating unecessary databases and couldn't figure out how to remove them so I would restart the set up
  - I would run into issues with rails g devise:install which forced me to restart the set up but I came across a stackoverflow post which advised I could just restart my laptop

I started by doing some basic frontend styling to get an idea of what I wanted my final product to look like. Initially I wanted to use framer to mock up something but I did not get around to doing that.

I found it very difficult to test as I would just pull a blank, so I opted to get more comfortable with rails and just started to code.

I reached as far as User Story 3 but as I lack testing, it isn't much of an achievement.

Most of my views are written using bootstrap (see Gem List), which made things easier and it was interesting to learn this technology.

## Things to consider

- If I were to start the day over again, I would perhaps give myself more time to research testing authentication and image uploading
- I would definitely commit after every step of set up (after set up attempt 3 you would hope I had more sense)
- Basically give myself time, I actually enjoyed the process behind this challenge
- Actually install a testing framework, literally just realised that I didn't install rspec so it doesn't matter that I gave up on testing


## Additional Gems

gem 'devise'
  - A really useful authenticator which comes with its own syntax making creating log in/sign up super easy (if you can get past how fussy it was - but perhaps that was just me)
gem 'pg'
  - I opted for postgresql over sqlite3, I am more familiar with it. You just need to go into database.yml and update sqlite3 to postgresql
import "bootstrap" (located in application.js)
  - I believe this is allowed through gem 'sass-rails', but I haven't confirmed that. I think bootstrap is so handy for styling, its very versitile and relatively easy to understand. I would definitely recommend for mobile-first websites (like instagram)


Instagram Challenge
===================

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
group :development, :test do
  gem 'rubocop', '1.20', require: false
  gem 'rubocop-rails'
end
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
