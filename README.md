Instagram Challenge
===================

This incomplete project is built using the user story below.   It aims to be a mash up of Instagram and Pinteresting where users can add photos to a board and then comment, like and tag those photos.

The core build is made up of the following classes and associations:-

Photos, which have many comments in a one(photo) to many(comments) relationship
Users, who have many comments in a one(user) to many(comments) relationship
Comments, who belong to both photos and users via the above relationships

The foreign keys of both photos and users have been added to the comment table with associations using active record.

When building a comment we are using   #@comment = #@photo.comments.build_with_user comment_params, current_user to ensure each comment belongs to both a photo and a user.

We have implemented the simple_form gem to help handle forms which required the use of :match => :prefer_exact to ensure Capybara can differentiate between password fields.

We used act_as_votable to create the 'like' system for photos.

The following functionality is still to be implemented.

1. The rendering of the username of each user who has commented on a photo
2. Use of jquery to update the like button
3. Mailers for password recovery

We also still need to add a pinterest style wall to the front end.

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
