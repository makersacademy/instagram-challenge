# Instagram Challenge

Challenge time: one weekend

The challenge was to build Instagram using Rails. An app should have users who can post pictures, write comments on pictures and like a picture.


### Installation

This project uses Ruby on Rails version 5.0.1 (http://rubyonrails.org) and Ruby version 2.3.3.

  * git clone/fork this repository

  * $ gem install rails

  * $ gem install bundler

  * $ brew install imagemagick

  * $ bundle install

  * $ bin/rake db:create

  * $ bin/rake db:migrate

  * $ bin/rails s

  * Open http://localhost:3000/ in your browser in order to access the app


### Testing framework

This project was tested using Rspec and Capybara.  In order to run and view the tests, run '$ rspec' from the command line.

## User Stories

```
  As a user
  So that I post pictures
  I need to register and log in to the website
```
```
  As a user
  So that I can post pictures
  I want to click a special upload button
```

```
  As a user
  So that I can interact with other users
  I want to be able to leave comments on their pictures
```

```
  As a user
  So that I can interact with other users
  I want to be able to leave 'likes' on their pictures
```
