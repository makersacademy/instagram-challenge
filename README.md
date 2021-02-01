Instagram Challenge
===================

**My stories:**\
User can sign up\
User can log in\
User can log out\

For user authentication I used the gem Devise which builds a lot of the routes and authentication methods. It has a nice feature of setting different roots, depending on whether a session is in clear or otherwise, and also allows you to divert any requests to other paths to the sign up /login page with the method   **before_action :authenticate_user!** in the controller. It also automates error messages which I need to adapt.

User can post a picture with a caption attached\

This needed ActiveStorage and **has_one_attached :image** in the Post model.

User can see list of posts in reverse chronological order\
User can delete their own posts\
User can edit their own posts - half completed.\
User can tag posts and filter posts by tags - not complete.

Next steps:\
Make backend API and frontend Javascript.\
Use React

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
