[![Build Status](https://travis-ci.org/rjlynch/instagram-challenge.svg?branch=master)](https://travis-ci.org/rjlynch/instagram-challenge)
Instagram Challenge
===================
![alt text](http://i.imgur.com/0MovEsD.png "Asciigram logo")

visit the [Asciigram](https://asciigram-app.herokuapp.com/) site

An instagram style website with posts, comments and likes that also converts your images to ascii art (step back from the screen and squint for best effect)

Built with Ruby on Rails (and a smattering of jQuery for asyncronus likes).
Images hosted with Amazon Web Services.
Tested with rspec and capybara.

Test Coverage
-------------
```
Leaving a comment
  doesnt allow visitors to comment
  sign up, make post
    allows users to leave a comment
    when parent post is destroyed, child comments are destroyed as well
    a comment can be deleted
    a comment can only be deleted by the author

Likes
  liking a post increase its like count

Post
  there are no posts until a first one has been created
  a user can view a post
  post cannot be made by a visitor
  theres a link to make a post on the front page
  signed up and post made
    when the user fills out the post form, the post is now displayed
    posts display the name of who created them
    deleting a post
      can be done by the user who made it
      and not by someone else
  uploading an image
    can upload an image

User
  user not signed in and on the homepage
    user should see a link to sign up
    user should see link to sign in
  user is signed in and on the homepage
    they should see sign out link
    they should not see a sign in link or a sign up link

Comment
  should belong to post
  should belong to user

Post
  should have many comments
  should belong to user

Finished in 5.89 seconds (files took 2.29 seconds to load)
23 examples, 0 failures
```
