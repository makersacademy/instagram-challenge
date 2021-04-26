Instagram Challenge
===================

## Summary

I had limited time to work on this challenge over the weekend so only managed to get some basic work done, reinforcing the previous weeks work. I had hoped to get onto working on rendered forms and some more advanced front end, but alas it was not to be.

The app is very simple using ruby on rails with a variety of gems to add additional features, the app allows:
- Post a gram with an image (Active Record) and text
- sign up and login/logout with hashed pashwords
- like a gram

It was developed largely through TDD (although to figure out some parts I had to part write the code in advance to figure out what was going on).

On Completion
- All tests passing
- rubocop - some errors I did not get a chance to figure out
-

## To use

1. git clone and run `bundle install`
2. type `bin/rails db:create`
3. type `bin/rails db:migrate`
4. type `rails s` to start server
5. visit localhost address on your browser - usually http://localhost:3000/


- For tests - `rspec` in the command line
- Rubocop - type `rubocop` in command line
- erb-lint - tried to implement was not working at time of upload....
<!-- type `erblint --lint-all --enable-all-linters` in command line -->

## To Do

- comments
- likes linked to users
- rendered forms
- understand routes more
- advanced css
- host on Heroku
- test CI

## Concerns

- Some of the routing I feel could be done in a different way
- need to look at refactoring controllers a little bit more
- need to understand if I am testing properly

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
