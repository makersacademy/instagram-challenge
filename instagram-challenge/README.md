Instagram Clone
===============

This app will be lovingly created with Rails.

User Stories
------------
```
As a passionate amateur photographer,
So I can show off my beautiful artwork,
I would like to be able to post images from my account.

As an opinionated art critic,
So I can view other people’s artwork,
I would like to be able to view images loaded by other people.

As an opinionated art critic,
So I can critique other people’s artwork,
I would like to be able to add a comment.

As a well cultured, worldly artiste,
So I can let other well cultured, worldly artistes know that I like their work,
I would like to be able to like their images.
```

Bonus User Story if I can Manage It
-----------------------------------
```
As a private individual,
So I can post images for only my friends to see,
I would like to be able to set my account as private.

As someone who rather likes their face,
So other users can see the artistic genius behind my images,
I would like to be able to add an image as my avatar (or take it from FB).
```

Controllers
-----------
* Images
* Comments
* Likes
* Users

Agile Testing
-------------
To ensure that I have a close view of the endpoint while I build, I will add my tests in the following order:
```
  [x] Images can be added to and viewed on site
  [x] Images can be liked and commented on
  [] Users can sign up and sign in and sign out
  [] Only users can add images to site
  [] Only users can like images on site and add comments to images
```

Feature Tests using RSpec and Capybara
--------------------------------------
  [] Images
    [x] Says when no image posts have been added to site
    [x] Shows images and captions that are in database
    [x] Lets a visitor upload and post an image with a caption
    [] Image caption can be edited after being posted
  [x] Comments
    [x] Visitor can comment on image posts
  [x] Likes
    [x] Visitors can like image posts
    [x] Displays number of likes for an image
  [] Users
    [] Only users can do the above things!
    [] Only users are able to delete photos posted from their account

Unit Tests using RSpec
----------------------
  * Image
    * Image can be added DONE
    * Image can be added with a caption/comment
    * Image knows how many likes it has
  * Comments
    * Comments can be added to images
  * User
    * User can sign up
    * User can sign in
    * User can only post images when signed in
    * User can sign in
    * Has a unique username
    * Can comment on images only if signed in

Wishlist
--------
If there's time, try to add/tweak the following:

* Like button - javascript
* Rspec test environment not working now I have Amazon Web Services (fine in dev env) - try to sort this out
* User sign up and sign in
* Users an sign in through Fb
* Better styling
* How to style 'choose file' button in erb forms??



















==Original README.md
== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
