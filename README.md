Instagram Challenge
===================

[![Build Status](https://travis-ci.org/Willibaur/instagram-challenge.svg?branch=master)](https://travis-ci.org/makers/instagram-challenge)
--------------------------------------------------

This is a solution to a challenge given by Makers Academy on week 7, part of Learn to code in 12 weeks course.

The aim of the challenge.
-------------------------

Create an Instagram clone application using Ruby on Rails, JS, HTML and CSS.

The application needs to be driven by TDD and BDD by using either RSpec or Cucumber.

When the application is 100% functional, needs to be deployed to Heroku.

### Optional Extra

Create filters

Deploy to Heroku


Technologies used
-----------------

  * Testing
    * RSpec
    * Capybara


  * Back end framework
    * JavaScript
    * Rails
    * Ruby 2.2.3


  * Front end framework
    * jQuery
    * CSS
    * Bootstrap


Testing and running environment setup
--------------------------------------

In order to edit, view or modify the source code, you will need to clone the repo shown below, access the folder and execute the following commands to be functional.


```sh
$ git clone git@github.com:[USERNAME]/instagram-challenge.git
$ cd instagram-challenge
$ bundle
$ rake db:setup
$ rspec
```

If you want to run the app

```sh
$ rake db:seed
$ rails s
$ open http://localhost:3000
```

Web access application
-----------------------



TODO
======
Create seed.rb file to inject initial values within the DB.

Contributors
------------

* [William Bautista](https://github.com/Willibaur)
