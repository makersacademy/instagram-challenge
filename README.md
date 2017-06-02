Instagram Challenge
===================

This is a (turtle-themed) Instagram clone built in Rails, for the week 8 weekend challenge at Makers Academy.

![Screenshot](http://imgur.com/cJja7Gc.png)

## Features

* Users can sign up, sign in and log out.
* Users can post pictures.
* Users can see a feed of all the posts. 
* Users can comment on pictures.

## How to run

#### Run

```
git clone git@github.com:honjintang/instagram-challenge.git
cd instagram-challenge
rake db:setup
rails/bin s
open http://localhost:3000/
```

#### Run tests

```
git clone git@github.com:honjintang/instagram-challenge.git
cd instagram-challenge
rake db:setup
rspec
```

## Technologies used

* Rails
* Devise
* CarrierWave
* Rspec/Capybara

## Project Brief

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## Further Work

* Like a picture
* Uses AJAX to update likes without page refresh
* Production environment stores images on AWS
* Add usernames for users
* Facebook login and Omniauth authentication

User Stories
-------------
```
As a turtle
So that I can post pictures,
I can sign in to Turtlegram.
```
```
As a turtle
So that I can document my turtle life,
I can post pictures to a feed.
```
```
As a turtle
So that all my photos are saved in one place,
I can see all my pictures in chronological order.
```
```
As a turtle
So that I can see how my friends are,
I can see all their photos in a feed.
```
```
As a turtle
So that I can keep in touch with my friends,
I can like their pictures.
```
```
As a turtle
So that I can keep in touch with my friends,
I can leave comments on their pictures.
```
```
As a turtle
So that I can make my friends jealous
I can add filters to my photos
```

