Instagram Challenge
===================
So, I didn't have much time this weekend. However, I did at least get a bit done! Users can sign up, login and post photos. Posts are displayed on the screen.
I did some testing, but not enough. You can't edit or delete posts. Users can't logout. A post is not attributed to a user in the view.
I didn't use strong params appropriately because I couldn't quickly get it to work so I bodged it. A walkthrough of how to fix this would be super helpful!
I did NOT style this at all. It looks horrific.
Images are saved to localstorage, but with more time I'd use a cloud-based storage system.

## Instructions for use:

* clone the repo
* cd birdstagram
* db:create, db:migrate

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
