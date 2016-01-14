# Instagram (a.k.a Filterspam) challenge

This is my solution to the sixth Makers Academy weekend challenge.

The task was to build an Instagram clone using rails.

![screenshot](http://i.imgur.com/9RJvXxQ.png)

## Setup
0. clone this repo
0. install postgresql
0. install imagemagick
0. `bundle update`
0. `bundle install`

## Usage
0. `createdb filterspam_development`
0. `rake db:migrate RAILS_ENV=development`
0. `rails s`
0. visit http://localhost:3000 in your browser

## Running tests
0. `createdb filterspam_test`
0. `rake db:migrate RAILS_ENV=test`
0. `rspec`
