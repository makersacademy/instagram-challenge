Instagram Challenge
===================

## The Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## My Solution

I've taken a design-led approach to this project.
* I started by creating user stories to understand which features needed be built
* I then designed the database and the relationships within it (see diagram below).
* Setting up the test suite was the next logical step, including the necessary gems for cleaning the database, creating factories and so on.
* I started building features using feature specs, following the RED-GREEN-REFACTOR process to develop the models, controllers and views.


### User Stories

**Epic | User Authentication**
```
As a prospective new user
So that I can create an Octogram account
I would like to be able to easily sign up
```
```
As an existing user
So that I can keep my details secure
I would like to be able to log out
```
```
As an existing user
So that I can revisit the images I have posted
I would like to be able to login
```

**Epic | Images**
```
As an existing user
So that I can share my #yolo moments with the world
I would like to post an image
```
```
As an existing user
So that I can bask in the glory of my photographic greatness
I would like to view the images that I have posted
```
```
As an existing user
So that I can give my eyes a feast of visual delights
I would like to view other people's images
```

**Epic | Posting Comments on Images**
```
As an existing user
So that I can share my thoughts on an image
I would like to post a comment on it
```
```
As an existing user
So that I can view what others think of my image
I would like to view the comments left on it
```


**Epic | Liking Images**
```
As an existing user
So that I can show my appreciation for the visual feast
I want to like other people's images
```
```
As an existing user
So that I can see how popular my images are
I would like to view each image's likes
```

### Database Design

![Image](http://i.imgur.com/k17AeCi.png)

### UI Design

Text on how Octogram has been designed goes here

### Technology

* **Application:** Rails 5.1.3
* **Testing:** Rspec, Capybara, Database Cleaner, SimpleCov, FactoryGirl, RuboCop
* **Database:** Postgresql, ORM: ActiveRecord
* **User Authentication:** Devise
* **Front End:** ERB, Bootstrap 4, HTML, CSS, JavaScript, JQuery

# How To Use

The project is currently a work in progress, and will be finished at a later date.

To view the current progress run the following in your terminal:

Step 1: Clone this repo
```
git clone git@github.com:annalaise/instagram-challenge.git
```

Step 2: Run the tests
```
bundle install
bin/rails db:create
bin/rails db:migrate
bundle exec rspec
```

Step 3: Run the app locally
```
rails s
```

**The app will be shipped to production (heroku) asap**
