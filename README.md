Instagram Challenge
===================

Weekend Challenge - Week 8


Set Up
--------

```
$ git clone git@github.com:riyapabari/instagram-challenge.git
$ cd instagram-challenge
$ bin/rake db:setup
$ rspec
```

How to run the program
--------
```
$ bin/rails s
$ open http://localhost:3000
```

Screenshots
--------
![Main scree](http://i.imgur.com/ZrMD98x.png?1)

Still To Do
---
* Add username to devise login
* Allow a user to delete a post
* Limit each user to 1 like per photo
* Host photos on AWS

User Stories
--------

```
As a user 
So that I can set up a profile
I can sign up with an email, password, and a unique username
```
```
As a user
So that I can be in control of my account
I can sign in and sign out
```
```
As a user 
So that I can share moments with my friends
I can post a photo
```
```
As a user
So that I can share moments with my friends
I can see photos they have posted on the home page
```

```
As a user
So that I know who has posted each photo
Users can only post a photo once I have signed up/logged in
```

```
As a user
So that I can be funny
I can add captions to my photos
```
```
As a user
So that I can show my friends some love
I can like my friends' photos
```

```
As a user
So that I can respond to photos that my friends post
I can make multiple comments on my friends' photos
```


Brief
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
