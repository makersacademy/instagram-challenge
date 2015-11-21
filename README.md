## Instagram Challenge

[Use this app on heroku](https://blooming-river-2172.herokuapp.com/)

#### Task:

Build an Instagram clone using rails. You'll need users who can post pictures, write comments on pictures and like a picture.

#### Breakdown of models:

+ User
+ Post
+ Comment
+ Like

#### Tools:

Testing: Rspec, Capybara, Shoulda, FactoryGirl

Code: Ruby on Rails

Other: Devise, Paperclip, PostgreSQL, AWS, HTML, CSS, Bootstrap

#### Testing:

_comments_
  + user must be logged in to create a comment
  + allows users to leave a comment
  + allows users to delete their own comments
  + users cannot delete others comments

_likes_
  + like count is displayed on posts
  + like count is increased by one when 'like' is clicked by user
  + users 'like' is removed if they click 'unlike'
  + likes can only be made by signed in users

_posts_
  + no posts have been added
    + should display a prompt to add a post
  + posts have been added
    + display posts
  + creating posts
    + user must be logged in to create a post
    + prompts user to fill out a form, then displays the new post
  + an invalid post
    + does not let you submit a blank post
  + images
    + lets user add images to post
  + viewing posts
    + lets a user view a post
  + editing posts
    + let a user edit a post
    + user can only edit their own posts
  + deleting posts
    + removes a post when a user clicks a delete link
    + user cannot delete another user's posts

  _User can sign in and out_
    + user not signed in and on the homepage
      + should see a 'sign in' link and a 'sign up' link
      + should not see 'sign out' link
    + user signed in on the homepage
      + should see 'sign out' link
      + should not see a 'sign in' link and a 'sign up' link

  _Post_
    + should have many comments
    + is not valid without user providing content

  _User_
    + should have many liked_posts
    + has comments

Finished in 2.64 seconds (files took 3.41 seconds to load)
27 examples, 0 failures
