Instagram Challenge     [![Build Status](https://travis-ci.org/UsmanJ/instagram-challenge.svg?branch=master)](https://travis-ci.org/UsmanJ/instagram-challenge) [![Coverage Status](https://coveralls.io/repos/UsmanJ/instagram-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/UsmanJ/instagram-challenge?branch=master)
======================

Synopsis
-----

The task set was to build an application which functions like Instagram. The web application should be able to store images and user details.

Features:
-------

```sh
As a user
So that I can sign up
I must be able to sign up

As a user
So that I can sign in
I must be able to sign in

As a user
So that I can like images
I must be able to like images

As a user
So that I can comment on images
I must be able to comment on images

As a user
So that I can delete my own images
I must be able to delete my own images

As a user
So that I can edit my own image title
I must be able to edit my image's title
```


Approach towards solving the challenge
--------------------------------------

I built the system using test-driven development to ensure that bugs can be eliminated. As you can see the build has 100% coveralls and all RSpec tests are passing.

The instagram clone is fully functional MVP. If you feel that there are any errors or improvements can be made then please let me know.


Technologies used:
------

* The application was coded in Ruby on Rails
* RSpec was used in order to conduct test-driven development
* AWS S3 was used to store images that are uploaded by users
* PostgreSQL is the database used in this project
* HAML was used for the view files

Installation:
------

To run the application you can either visit it on [Heroku](https://usmaninstagram.herokuapp.com/).

-- or --

Download a clone of this repo and use 'rails s' to run it on your localhost.


Tests
------

You can check the tests by running 'rspec' in the root folder of the project in terminal.
