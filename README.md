Not The Instagram Challenge
==========================

#### Week 7: Makers Academy Weekend Challenge

I'm not a fan of Instagram, so this week I had a go at building my own new project in rails instead. (Not The Instagram Challenge, has very similar requirements to the Instagram Challenge.)

My aim was to work on a proper database version of the very many local websites that help new mums keep their sanity by listing out baby activities, e.g.:

http://www.edtots.co.uk/directory/monday

http://se19kids.com/monday/

#### User Stories

```
As a class provider
So that I can promote my classes
I would like to create an account & sign in

As a class provider
So that I can promote my classes
I would like to create a listing for each of my classes
  e.g. Day:           Monday
       Time:          16:00
       Suitable for:  Babies
       Venue:         St Hilda's Church

As a class provider
So that people can recognise my brand
I would like to attach images of my classes, logo and flyers to my account

As a parent
So that I can choose a class
I would like to see a list of classes, ordered by time

As a parent
So that I can support classes I like
I would like to be able to leave a review (or an endorsement)
```

#### How It Currently Works
* The app currently takes one type of user (the class providers). Only logged in users can create a class listing.

* The home page displays all listings from the database and links to a #show page for each provider. You don't need to be logged in for this.

* The #show page displays that provider's gallery of images and a summary of the provider's class timetable.

The project can be run as follows:
1. `git clone git@github.com:saratateno/instagram-challenge.git`
2. `cd instagram-challenge`
3. `bin/rake db:create`
4. `bin/rake db:migrate`
5. `rails s`
6. Visit `http://localhost:3000/`

Repeat 3 & 4 with `RAILS_ENV=test` if you wish to run tests)

#### What I Actually Managed To Do

I completed the first three User Stories (to some extent) and had to work on resolving the following issues:
* Ruby doesn't store Time objects without a date. The listings controller takes `:hour` and `:mins` params from the user's listing entry, converts them into a `:start_time` and stores them as an integer of number of minutes since midnight in the database. This value is converted back to a time format when displayed.
* Devise: I edited the default settings to require a provider name be entered upon signing up.


Some other issues that I didn't manage to resolve:
* When adding the time for a listing: How to set the dropdown list to show only 5 min intervals (and also display a leading 0
* How to customize Devise properly so that more things could be created as part of the registration process (and should they also be edited via Devise routes?). Instead I created a new set of 'Pictures' routes to handle these separately.




STILL NEED TO WRITE TESTS FOR:
* Listing & pictures being dependent destroy on User
* Adding pictures
* Editing & deleting users
* Editing & deleting listings

------


Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
