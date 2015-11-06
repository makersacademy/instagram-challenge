[![CoverageStatus](https://coveralls.io/repos/ljones140/StieglitzGram/badge.svg?branch=master&service=github)](https://coveralls.io/github/ljones140/StieglitzGram?branch=master)
[![BuildStatus](https://travis-ci.org/ljones140/StieglitzGram.svg)](https://travis-ci.org/ljones140/StieglitzGram)
[![Code Climate](https://codeclimate.com/github/ljones140/StieglitzGram/badges/gpa.svg)](https://codeclimate.com/github/ljones140/StieglitzGram)


#StieglitzGram

This application is an online gallery for photographers to upload their photos. In a similar style to Instagram.

I have named my instagram clone after Alfred Stieglitz who is regarded as being  responible for making photagraphy an accepted art form.
At the time photography was seen as hobbyists pastime for bicycle clubs to record their travels. Stieglitz was instramental in getting fine art institutions (most notably MOMA) to the show the work of photographers alongide painters and sculptors.  He was was also married to painter Georgia O'Keeffe

##Approach

Application was built using BDD. Feature tests were written first, then either code or if nesessary a unit test was written. This allowed the domain model to emerge as the test, code refactor cycle iterated.

##Technology used



The application is built on Rails with Postgres as a database with Foundation as the frontend framework. Also uses Jquery for some AJAX for some features. ImageMagick is used for the photo uploading.

Testing: RSpec and Capybara were used with Thoughtbots FactoryGirl and Shoulda gems to help with the testing. To feature test the Javascript Poltergeist.


##Installation

Need to ensure you have ImageMagick and Postgres installed locally and also Poltergeist if you would like to run the tests

```sh
git clone the repo git@github.com:ljones140/instagram-challenge.git
#in directory run
bundle install
rails s
#to run tests
rspec
```

I have git ignored the photos I used for testing. You need to add them to /spec/assets_specs/photos/ if you would like to test images.

user stories

```
As a candid phototographer
so I can show people my photos
I want to post my photos to StieglitzGram

As a candid photographer
So that I can post photos on StieglitzGram
I would like to join up to StieglitzGram

As a candid photographer
So that I can post photos as me
I want to log into StieglitzGram

As a candid photographer
So that I can avoid others posting as me
I want to log out of StieglitzGram

As a candid photographer
so I can tell other photographers what I think of photos
I would like to comment on any photo

As a candid photographer
so that I can indicate wether I like a photo
I would like to be able to add a like to any photo

As a curator of photography
so I can see which photos are popular
I would like to be able to see the count of likes per photo

As a curator of photography
so that the popularity is fair
only members of StieglitzGram are allowed to like photos

As a curator of photography
so that the popularity is fair
Each member should only be able to like a photo once

```


Lessons learnt
--------------
* There are issues with turbolinks and Jquery a wrote a gist on how I solved it [here](https://gist.github.com/ljones140/5680d652ab5e244e6838)
* factory girl set up with rails. Install factory girl at start of project and it will build the factory template files for you as you add
* git ignore the photos directy so they are not uploaded to git hub
* Phantom JS for javascript testing with capybara
* If using phantom js in a test it affects factory girl factories. If you call them inside test block they will not be recognised.
*

To implement in next version
----------

* Sign in with facebook/twitter etc: Omniauth could be used for this
* See list of users who have liked : As in instagram
* host photos on AWS : Will need to do this in order to deploy 


