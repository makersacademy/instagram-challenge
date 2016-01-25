Instagram Challenge
===================

Overview
-------
* This is my solution to Makers Academy Week 7 challenge, producing an image-uploader with persistent storage of images, comments and likes.
* This app was test-driven using RSpec for unit tests and RSpec/Capybara for feature tests.
* Users are able to sign up, sign in and sign out. When registered, users may upload an image, comment on images, and like images. Users are limited to one like per image.
* When signed in, users are able to edit and delete their own images and comments.
* When not signed in, users are able to view images, comments and likes.


Installation instructions
-------
* Clone the repository to your local machine and change into the directory
```
$ git clone git@github.com:edwardkerry/instagram-challenge.git
$ cd instagram-challenge
```

* Run Rake commands to build the database and run the migrations
```
$ rake db:create
$ rake db:migrate
```

* Launch the app
`$ rails s`

* Visit the site
`http://localhost:3000`

* Image storage makes use of Amazon Web Services S3 cloud storage, and Facebook's log-in managed through OmniAuth. The following local environment variables must be valid and available to use this app.
```
S3_BUCKET_NAME
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
FACEBOOK_APP_ID
FACEBOOK_APP_SECRET
```

User Stories
-----

```
As a User
So I can start instragramming
I want to sign up

As a User
So I can return to instagram
I want to sign in

As a User
So I can finish instragramming
I want to sign out -->

As a User
So I can show off my instagrams
I want to post a picture

As a User
So I can show off my instagrams
I want to give my picture a title and description

As a User
So I can improve my instagrams
I want to edit my own picture's title and description

As a User
So I can tidy my instagrams
I want to delete my pictures

As a User
So I can talk about pictures
I want to be able to comment on all the pictures

As a User
So I can change my mind
I want to be able to delete my own comments

As a User
So I can see when comments were posted
I want to see a timestamp

As a User
So I can quickly show my support
I want to be able to like a picture

As a web developer
So my machine doesn't get full of pictures
I want Amazon to store them for me

As a web developer
So I can store the details
I want a table called users

As a web developer
So I can monitor associations
Users should have many pictures and pictures belong to Users

As a web developer
So I can monitor associations
Users should have many comments and comments belong to Users

As a web developer
So I can monitor associations
Pictures should have many comments and be joined to them through Users

As a web developer
So I can monitor associations
Pictures should have many likes and be joined to them through Users
```

Future functionality
-----
```
As a User
So I can enjoy visiting
I the site to look good

As a User
So I can see the most recent pictures
I want them to be ordered on the home screen

As a User
So I can see the most popular pictures
I want them to be ordered by likes on the home screen

As a web developer
So the world may enjoy my creation
I want it to be hosted online
```
