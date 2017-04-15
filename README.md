Instagram Challenge - InstAsh
=============================

InstAsh is an 'Instagram-clone'. It was done over a weekend after my 8th week at Makers Academy. The following were the instructions given to get the project started:

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

I started by writing the following user stories:

### User Stories
```
As a User,
So that I can share my pictures with the world
I want to be able to upload pictures with short descriptions.

As a User,
So that I can express my views/opinions about a picture
I want to be able to comment on pictures

As a User,
So that I can show that I like a picture
I want to be able to like a picture

As a User,
So that I can use services provided by instagram-challenge
I want to be able to login

```

* Ruby version used is 2.2.3 and Rails version is 4.2.8

* System dependencies - rspec-rails, capybara, shoulda, devise, database_cleaner, poltergeist, paperclip


### Instructions on running the app and tests
- ```git clone https://github.com/AAMani5/instagram-challenge.git```

- ```cd instagram-challenge```

- ``` bin/rake db:create ```

- to run tests ``` rspec ```

- to visit website ``` bin/rails s ``` and type ``` http://localhost:3000/ ``` on Google Chrome

### Further user stores to work on:

```
As a User,
So that I can amend the look of my pictures
I want to be able to use filters
```
