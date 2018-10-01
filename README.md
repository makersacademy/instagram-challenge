# Makers Instagram Challenge

A TDD project aiming to replicate (some of) Instagram!

### Features

* See all posts, select individual posts in detail view, upload an image
* Flash alerts for validation (e.g. if no image attached when attempting to create post)
* Basic image/caption posting using the Paperclip gem
* Some feature tests using the (now-deprecated) FactoryGirl gem as well as Capybara

### Stack

* Ruby on Rails
* HTML (with ERB)
* Bootstrap and CSS
* RSpec and Capybara (for feature tests) 

Heavily influenced by [this tutorial](https://www.devwalks.com/lets-build-instagram-test-driven-with-ruby-on-rails-part-1/)

### What still needs doing?

* Edit, delete, comment on post, like a post
* Sign up, log in, log out
* Improve the layout (issues with some forms/buttons and css/bootstrap)
* Get rid of the array of post data at the bottom of the posts page (where is this coming from?)
* Finish the tutorial (and delete this sentence)

### How to get started

* clone the repo
* bundle install
* run rails s to start server, go to localhost:3000
