Instagram Clone
=================
This is an Instagram clone built in Rails. It is the week 8 homework challenge at Makers Academy.

![screen shot](public/Screenshot 2017-01-16 09.45.19.png)

Features
----------
* User can sign up
* Post a picture
* Comment on a picture
* Like a picture
* Uses AJAX to update likes without page refresh
* Production environment stores images on AWS

Heroku
--------
Visit the site on [Heroku](https://insta-clone-474.herokuapp.com/)

Usage
---------
### Run

First do the following:
```
git clone git@github.com:cjcoops/instagram-challenge.git
cd instagram-challenge
rake db:create
rails/bin s
```
Then visit http://localhost:3000/

### Test
```
git clone git@github.com:cjcoops/instagram-challenge.git
cd instagram-challenge
rake db:create
rspec
```

Technologies Used
----------

* Rails
* Jquery
* Devise
* Paperclip

#### Testing
* Rspec
* Capybara
* Poltergeist

Project
----------------
#### Objectives
* Practice using the Rails framework to build a full stack web app
