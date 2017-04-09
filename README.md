Instagram Challenge
===================

Task
-----

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome). Time allowed - 1 weekend.

## User stories

MVP:

```
As a user
So I can show my friends the cool things I've done
I want to be able to post photos

As a user
So I can change my mind about a photo I posted
I want to be able to delete and edit my photos

As a user
So I can see what my friends are up to
I would like to see a stream of their photos

As a user
So I can let my friends know what I think
I want to be able to leave comments on photos

As a user
So I can see how popular my photos are
I would like other users to be able to like them
```

Version 2

```
As a user
So I can control what is posted to my page
I would like to sign in and out

As a user
So I know who is posting what
I want to see the name of the poster with each post and comment

As a user
So the stats aren't skewed
I want people to only be able to like a photo once

As a system maintainer
So I can monitor what the site is being used for
I want only registered users to be able to post photos/comments

As a user
To enhance my experience
I would like the website to look good
```

Version 3

```
As a user
For convenience
I would like to be able to sign in with Facebook

As a user
So I can make my photos look better
I want to be able to add filters

As a user
So people can see all my photos in one place
I would like a profile page with clickable thumbnail photos
```

## Technologies used
- Ruby, Rails, HTML, CSS, Devise, Paperclip, Cloudinary
- Tested with RSpec, Capybara, Shoulda

## How to use
You can view the app on https://hidden-cove-45818.herokuapp.com/
To download and run tests:
- Clone this repo
- Bundle install
- Run RSpec in the Command line

## Approach taken

- Worked out user stories, which I categorised into those required for the MVP, Version 2, and Version 3.
- Began by creating Photos, Comments, and Likes - used Paperclip to allow photo upload
- Then added user class with the help of the Devise gem and linked users to all the other classes. I also linked photos to likes and comments.
- Struggled with routing and forms, as I wanted users to be able to like photos and leave comments directly on the index page, rather than having to click on to an individual photo page first. Achieved using instance variables, and inserting Comment.new and Like.new into the Photo controller on photos#index - feel like there should be a better way to do this
- Would like to prevent the page from refreshing using AJAX when someone likes a photo or comments, but didn't get time to do this.
- Ran out of time before completing Version 3 - I would like to use OmniAuth to allow Facebook sign in, and create a profile page showing all photos for one user. I also would like to remove the edit and delete buttons from the index page and only have them accessible via the profile page to the user whose photo it is.
