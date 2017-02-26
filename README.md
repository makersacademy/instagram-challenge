Instagram Challenge
===================

The week eight challenge at Makers Academy, to build a 'Instagram' clone.

Here is a link to the live version on [heroku](https://insta-sham.herokuapp.com/)

Installation
------------


* Clone from github
```
$ git clone https://github.com/BenJohnCarson/instagram-challenge.git
```

* Switch to ruby 2.3.3
```
$ rvm use 2.3.3
```

* Install gems
```
$ gem install bundler
$ bundle
```

* Setup postgres databases

Make sure you have PostgreSQL setup on your machine, then run the following commands
```
$ rake db:create
$ rake db:migrate
```
* Running the application
```
$ bin/rails server
```

* Running tests
```
$ rspec
```

Technologies used
-----------------

* Rails
* PostgreSQL Database
* Ruby
* RSpec + Capybara
* Cloudinary
* CarrierWave
* 

