Instagram Challenge
===================

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


MVP User Stories 1: App Distinct Features
-----

```
As a user
So I can share my pictures with other users
I need to be able to post my pictures on the site

As a user
So I can let other users know my thoughts
I want to be able to comment on the pictures

As a user
So I can let other users know I like their pictures
I want to be able to 'like' pictures

As a user
So I can take off pictures I no longer want to share
I want to be able to delete my pictures

As a user
So I can view pictures other users have shared
I want to see a list of images on the site

As a user
So I read all comments on a picture
I can view all comments on each picture

As a user
So I can see how popular a picture is
I can see how many 'likes' a picture has
```

MVP User Stories 2: User / Account Features
-----

```
As a user
So I can use the app
I can sign up to the website

As a user
So I can comment and like the pictures
I can log into the website

As a user
So I know I am logged in
I can see my username on the page

As a user
So I can stop others from using my account
I can sign out of the website

As a user
So other users know the picture I post (and vice versa)
I can see the author(by username) of each picture

As a user
So other users know my comments and vice versa
I can see the author(by username) of each comments

As a user
So users can't cheat about their picture popularity
I can only like a picture once
```

Approach
-----
After writing the user stories, I create a diagram to extract classes, their properties and relationships.
