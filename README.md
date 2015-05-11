Sanjagram Challenge
=======================

[![Build Status](https://travis-ci.org/sanjsanj/instagram-challenge.svg?branch=master)](https://travis-ci.org/sanjsanj/instagram-challenge)  [![Coverage Status](https://coveralls.io/repos/sanjsanj/instagram-challenge/badge.svg)](https://coveralls.io/r/sanjsanj/instagram-challenge)

[Use this app on Heroku](https://sanjagram.herokuapp.com)

![screenshot](http://sanjsanj.github.io/images/week8_sanjface.png)

Task:
-----

Build an [Instagram](https://www.instagram.com) clone using Rails.   You'll need users who can post pictures, write comments on pictures and like a picture. It will need to look like the Instagram website or better.

Breakdown Of Models:
--------------------

- User
- Image
- Comment
- Like

Tools:
------

Testing: Rspec, Capybara, JQuery, Shoulda

Code: Ruby on Rails

Other: Devise, Paperclip, PostgreSQL, HTML, CSS, Bootstrap

Development Blog:
-----------------

- [Day 0](http://sanjsanj.github.io/Week%208,%20Day%205/)
- [Day 1](http://sanjsanj.github.io/Week%208,%20Day%206/)
- [Day 2](http://sanjsanj.github.io/Week%208,%20Day%207/)

Tests:
------

```
Commenting
  allows users to comment on an image from the homepage
  allows users to comment on an image from the image page
  shows link back to homepage after commenting
  does not let you submit a comment of less than 3 characters

Images
  Website on initialization
    should display a prompt to add an image
  when image has been added in the database
    will display image description
  when user uploads images
    prompts them to enter a description, then displays description
    they must attach an image
  when user visits website
    lets them view uploaded images
  editing image descriptions
    let a user edit their image description
    does not let a user edit someone else's image description
  deleting images
    removes an image when a user clicks a delete link
    only works if image was uploaded by current user

Likes
  an image initializes with zero likes
  there is a like button
  a user can like an image, which updates the image likes count
  a user cannot like an image more than once

User management
  when user not signed in
    should see a 'sign in' link and a 'sign up' link
    should not see 'sign out' link
    asked to sign up or sign in to upload an image
    has to sign up or sign in to comment on an image
    has to sign up or sign in to like an image
  when user signed in
    should see 'sign out' link
    should not see a 'sign in' link and a 'sign up' link
    should see link to upload an image
    should see link to comment on an image
    should see link to like an image
  when an email address is already taken
    it cannot be used to sign up again

Comment
  should belong to image
  should belong to user
  is not valid with less than three characters

Image
  should have many comments
  should have many likes

Like
  should belong to image
  should belong to user

User
  should have many images
  should have many likes
  should have many liked_images

38 examples, 0 failures
```
