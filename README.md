# Instagram Clone

[![Build Status](https://travis-ci.org/DataMinerUK/instagram-challenge.svg)](https://travis-ci.org/DataMinerUK/instagram-challenge) [![Test Coverage](https://codeclimate.com/github/DataMinerUK/instagram-challenge/badges/coverage.svg)](https://codeclimate.com/github/DataMinerUK/instagram-challenge/coverage) [![Code Climate](https://codeclimate.com/github/DataMinerUK/instagram-challenge/badges/gpa.svg)](https://codeclimate.com/github/DataMinerUK/instagram-challenge)

This is a basic instagram clone. Users can sign up. Post images. Likes, comment and tag images. Users have profile pages with all their images. Tag pages show all images associated with that tag. Images and comments can be deleted by their creator.


## Getting Started

```bash
git clone https://github.com/DataMinerUK/instagram-challenge.git
cd instagram-challenge
bundle install
bin/rake db:create
bin/rake db:migrate
rails s # -b 0.0.0.0 when running on a VM
```

Go to localhost:3000

## Testing

Run Rspec

```sh
rspec
```

## [v1.0](https://github.com/DataMinerUK/instagram-challenge/releases/tag/v1.0)

* Users can post images, like images and comment on images
* All images can be viewed and appear in order of amount of likes
* Each image can be viewed on its own page
* An individual image page will show its likes and comments
* Descriptions and comments cannot be empty

## [v2.0](https://github.com/DataMinerUK/instagram-challenge/releases/tag/v2.0)

* Users images can be viewed on a users page
* Users can delete images from their user page
* Comments can be deleted by their creators
* Images have tags
* Tags have a page where you can view all the images they are associated with

## v3.0

* Use partials
* Add styling
* Add dynamic loading
* Use Bootstrap

## Lessons Learnt

* Test coverage is hard. Finding elements on the page using CSS selectors with Capybara `find` is a pain. It does not seem to work like JQuery
* You cannot set a default on a property using `rails g migration`. Change this in the migration file before you `rake db:migrate`
* When using FactoryGirl you need to use a [sequence](https://github.com/DataMinerUK/instagram-challenge/blob/master/spec/factories/user.rb#L3-L5) for properties which need to be unique
* For password confirmation you need to [confirm](https://github.com/DataMinerUK/instagram-challenge/blob/master/spec/factories/user.rb#L17-L19) a FactoryGirl user after creation
* To generate a migration for a join table you need to use `bin/rails g migration CreateJoinTableImageTag image tag` where the classes to be associated *have* to be in alphabetical order
* When adding a username to a Devise user you need to add [this](bin/rails g migration CreateJoinTableImageTag image tag) to the application controller
* You have to write you own [method](https://github.com/DataMinerUK/instagram-challenge/blob/master/app/models/image.rb#L27-L35) for the many-to-many association for creating tags or adding the image association to one
