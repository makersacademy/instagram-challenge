Instagram Challenge (A.K.A. Shnapshots)
===================

#### User Stories
```
As a person
So that I can use Shnapshots
I would like to sign up
```
```
As a person
So that I can see posted pictures on Shnapshots
I would like to visit Shnapshots without having to log in
```
```
As a User
So that I can post pictures to Shnapshots
I would like to upload pictures from my photo libraries
```
```
As a User
So that I can share my opinion about a picture
I would like to be able to comment on it
```
```
As a User
So that I can show my appreciation for a picture
I would like to be able to 'like' a photo
```
Bonus
```
As a User
So that I can embellish my Pictures
I would like to apply filters to them
```

#### Relations
Users
- have_many pictures
- *can make many comments*
- *can like many pictures*

Pictures
- belong_to User
- have_many comments
- have_many likes

Comments
- belong_to pictures
- belong_to users

Likes
- belong_to users
- belong_to pictures





Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
* Forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
