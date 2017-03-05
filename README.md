
# Instagram Clone ![Travis CI](https://travis-ci.org/sliute/instagram-challenge.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/sliute/instagram-challenge/badge.svg?branch=master)](https://coveralls.io/github/sliute/instagram-challenge?branch=master)

## Task

Clone [Instagram](http://www.instagram.com).

## User Stories

```
I. CRUD

As a User,
So that I gain peer approval & very transient glory
I want to post a picture with a caption.

As a User,
So that I feel proud,
I want to view my glorious post.

As a User,
So that I accommodate my perfectionism
I want to be able to update a post.

As a User,
So that I can erase my tracks and young age mistakes
I want to be able to delete a post.


II. Users

As a User,
So that I'm recognised as an individual,
I want to sign up.

As a User,
So that only I can use this puny clone as myself,
I want to sign in and sign out.

As a User,
So that others are envious of me,
I want to be able to use the site only if I have signed in.

...

(to be continued)
```

## Tech Specs

* Ruby 2.4.0
* Rails 5.0.1
* Postgresql
* Rspec-rails & Capybara
* haml & haml_rails
* simple_form
* paperclip
* factory_girl_rails
* bootstrap-sass
* devise

## How To Download and Run the App

In your terminal:

```
$ git clone https://github.com/sliute/instagram-challenge.git
$ cd instagram-challenge
$ bundle
$ bin/rake db:create
$ bin/rake db:migrate
$ bin/rails s
```
Then visit [localhost:3000](http://localhost:3000).

## Progress

1. __CRUD__
  * TDD-driven development of CRUD functionalities based on [this](https://www.devwalks.com/lets-build-instagram-in-rails-part-1/) resource.
    - Migrated all views from ERB to HAML.
    - Learned to use factory_girl_rails in conjunction with paperclip.
    - Learned to use simple_form.
    - Styled with bootstrap-sass.
2. __Users__
  * TDD-driven development of user functionalities (sign up, sign in, sign out).
    - Used devise for user management (including its own, automatically generated views).

## Issues

1. __CRUD__
  * Ran into a potential issue with Capybara testing forms generated via simple_forms gem. Submitted issue/report to relevant places (plataformatec).
  * Some elements in forms do not use the proper styles - must investigate why.
2. __Users__
  * ...
    - ...
