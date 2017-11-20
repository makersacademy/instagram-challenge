Unconvincedagram - an Instagram Clone
===============================

A web app which allows the user to:
* Create an account
* Upload photos
* Edit captions on photos
* See all posts on the homepage

![Screenshot](https://i.imgur.com/cnal5s5.png)

## Technologies Used

* Ruby 2.4.2 - server-side (add version)
* Rails 5.1.4 - web framework
* HTML, CSS - front-end
* Amazon Web Services S3 - image hosting
* RSpec,Capybara - testing

## Directory Structure

```
|-- instagram-challenge
    |-- .DS_Store
    |-- .env
    |-- .gitignore
    |-- .rspec
    |-- Gemfile
    |-- Gemfile.lock
    |-- README.md
    |-- Rakefile
    |-- config.ru
    |-- package.json
    |-- app
    |   |-- assets
    |   |   |-- config
    |   |   |   |-- manifest.js
    |   |   |-- images
    |   |   |   |-- .keep
    |   |   |   |-- camera-icon.png
    |   |   |-- javascripts
    |   |   |   |-- application.js
    |   |   |   |-- cable.js
    |   |   |   |-- home.coffee
    |   |   |   |-- posts.coffee
    |   |   |   |-- channels
    |   |   |       |-- .keep
    |   |   |-- stylesheets
    |   |       |-- application.css
    |   |       |-- home.scss
    |   |       |-- posts.scss
    |   |       |-- fonts
    |   |           |-- richardm-webfont.woff
    |   |           |-- richardm-webfont.woff2
    |   |-- channels
    |   |   |-- application_cable
    |   |       |-- channel.rb
    |   |       |-- connection.rb
    |   |-- controllers
    |   |   |-- application_controller.rb
    |   |   |-- home_controller.rb
    |   |   |-- posts_controller.rb
    |   |   |-- concerns
    |   |       |-- .keep
    |   |-- helpers
    |   |   |-- application_helper.rb
    |   |   |-- home_helper.rb
    |   |   |-- posts_helper.rb
    |   |-- jobs
    |   |   |-- application_job.rb
    |   |-- mailers
    |   |   |-- application_mailer.rb
    |   |-- models
    |   |   |-- application_record.rb
    |   |   |-- post.rb
    |   |   |-- user.rb
    |   |   |-- concerns
    |   |       |-- .keep
    |   |-- uploaders
    |   |   |-- image_uploader.rb
    |   |-- views
    |       |-- devise
    |       |   |-- confirmations
    |       |   |   |-- new.html.erb
    |       |   |-- mailer
    |       |   |   |-- confirmation_instructions.html.erb
    |       |   |   |-- email_changed.html.erb
    |       |   |   |-- password_change.html.erb
    |       |   |   |-- reset_password_instructions.html.erb
    |       |   |   |-- unlock_instructions.html.erb
    |       |   |-- passwords
    |       |   |   |-- edit.html.erb
    |       |   |   |-- new.html.erb
    |       |   |-- registrations
    |       |   |   |-- edit.html.erb
    |       |   |   |-- new.html.erb
    |       |   |-- sessions
    |       |   |   |-- new.html.erb
    |       |   |-- shared
    |       |   |   |-- _links.html.erb
    |       |   |-- unlocks
    |       |       |-- new.html.erb
    |       |-- layouts
    |       |   |-- application.html.erb
    |       |   |-- mailer.html.erb
    |       |   |-- mailer.text.erb
    |       |-- posts
    |       |   |-- _form.html.erb
    |       |   |-- _post.html.erb
    |       |   |-- edit.html.erb
    |       |   |-- index.html.erb
    |       |   |-- new.html.erb
    |       |   |-- show.html.erb
    |       |-- shared
    |           |-- _errors.html.erb
    |-- bin
    |   |-- bundle
    |   |-- rails
    |   |-- rake
    |   |-- setup
    |   |-- spring
    |   |-- update
    |   |-- yarn
    |-- config
    |   |-- application.rb
    |   |-- boot.rb
    |   |-- cable.yml
    |   |-- database.yml
    |   |-- environment.rb
    |   |-- puma.rb
    |   |-- routes.rb
    |   |-- secrets.yml
    |   |-- spring.rb
    |   |-- environments
    |   |   |-- development.rb
    |   |   |-- production.rb
    |   |   |-- test.rb
    |   |-- initializers
    |   |   |-- application_controller_renderer.rb
    |   |   |-- assets.rb
    |   |   |-- backtrace_silencers.rb
    |   |   |-- carrierwave.rb
    |   |   |-- cookies_serializer.rb
    |   |   |-- devise.rb
    |   |   |-- filter_parameter_logging.rb
    |   |   |-- inflections.rb
    |   |   |-- mime_types.rb
    |   |   |-- wrap_parameters.rb
    |   |-- locales
    |       |-- devise.en.yml
    |       |-- en.yml
    |-- db
    |   |-- schema.rb
    |   |-- seeds.rb
    |   |-- migrate
    |       |-- 20171115213123_devise_create_users.rb
    |       |-- 20171115215233_create_posts.rb
    |       |-- 20171117142313_add_image_to_post.rb
    |-- lib
    |   |-- assets
    |   |   |-- .keep
    |   |-- tasks
    |       |-- .keep
    |-- log
    |   |-- .keep
    |   |-- development.log
    |   |-- test.log
    |-- public
    |-- spec
    |   |-- rails_helper.rb
    |   |-- spec_helper.rb
    |   |-- features
    |   |   |-- post
    |   |   |   |-- post_spec.rb
    |   |   |-- users
    |   |       |-- signup_spec.rb
    |   |-- models
    |       |-- post_spec.rb
    |       |-- user_spec.rb
    |-- test
    |   |-- application_system_test_case.rb
    |   |-- test_helper.rb
    |   |-- controllers
    |   |   |-- .keep
    |   |   |-- home_controller_test.rb
    |   |   |-- posts_controller_test.rb
    |   |-- fixtures
    |   |   |-- .keep
    |   |   |-- posts.yml
    |   |   |-- users.yml
    |   |   |-- files
    |   |       |-- .keep
    |   |-- helpers
    |   |   |-- .keep
    |   |-- integration
    |   |   |-- .keep
    |   |-- mailers
    |   |   |-- .keep
    |   |-- models
    |   |   |-- .keep
    |   |   |-- post_test.rb
    |   |   |-- user_test.rb
    |   |-- system
    |       |-- .keep
    |-- tmp
    |-- vendor
        |-- .keep
```

## Instructions

First clone the repo from GitHub:
```
$ git clone git@github.com:jonsanders101/instagram-challenge.git
$ cd instagram-challenge
```

Then create a `.env` file at the root of the directory, filling in your Amazon S3 credentials like so:

```
S3_KEY=YOURDETAILSHERE
S3_SECRET=YOURDETAILSHERE
S3_REGION=YOURDETAILSHERE
S3_BUCKET=YOURDETAILSHERE
```
Then launch a local server:

```
$ bin/rails server
```
Open a web browser and enter `localhost:3000`.

### Running the Test Suite

```
$ rspec
```
