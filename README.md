# Instagram Clone

## Makers Academy - Week 8 (weekend project)

First attempt at this, I am using David Battersby's 'Build an Instagram Clone' Youtube tutorial. Interested in how he uses Bootstrap, SCSS and cloud based image storage. 

[Outline](#outline) | [Specifications](#specifications) | [Planning](#planning) | [Installation Instructions](#installation-instructions) | [Tech stack](#tech-stack) | [Challenges](#challenges)

## Outline

To write a clone of Instagram.

## Specifications

### User stories
```
As an unregistered user
So that I can make a post
I want to be able to create an account

As a registered user
So that I can use my account
I want to be able to log in

As a registered user
So I can share my experiences
I want to be able to upload a picture

As a registered user
So all my information is in one place
I want a fully functioning profile page

As a registered user
So that I can contribute to the community
I want to be able to make comments on other people's pictures

As a registered user
So that I can show my appreciation
I want to like someone else's picture
```

## Installation Instructions

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000

```

## Tech stack

Back-end:

* Ruby/Rails

Front-end:
* CSS/HTML
* Javascript
* JQuery

Testing:

* Capybara
* RSpec
* SimpleCov

Linting:

* Rubocop

## Challenges
So many problems!
* Accessing Devise views. Solution - `rails generate devise:views users`
* Yarn issues, not the correct version. Then the webpacker gem wouldn't work - https://github.com/rails/webpacker/issues/940;
* Issues with gems being the wrong versions - when using carrierwave or AWS use these gems: gem 'carrierwave-aws', gem "fog-aws".
* Aws/carrierwave upload problems. Firstly my carrierwave config couldn't find my ENV keys, then the bucket created in AWS wouldn't accept that I was the one uploading to it - had to change the permissions. Solution - https://stackoverflow.com/questions/41663925/missing-required-arguments-aws-access-key-id-aws-secret-access-key-in-server; https://www.bitesite.ca/blog/fixing-rails-carrierwave-amazon-s3-403-forbidden-error
* Routing problems with the sign out link - the server keeps reading the pathway as a Get request when the code is a delete/destroy method. Eventually found a work around using 'button_to' with 'link_to', although the css is now off. Solution - https://stackoverflow.com/questions/6557311/no-route-matches-users-sign-out-devise-rails-3
* The image_tag couldn't read the pathway until I used string interpolation. This also took a while to work out as the example given in the tutorial didn't have this.
* Challenges with writing tests as the tutorial hasn't been test driven.
* Can't seem to access pictures in a folder in my AWS bucket on my dashboard for no specific reason (unresolved for now)
* Pictures are also now unable to upload because of mini_magick issues - `Brew Install ImageMagick` I think has solved it (https://stackoverflow.com/questions/10810356/carrierwave-error-msg-failed-to-manipulate-with-minimagick-maybe-it-is-not-an)