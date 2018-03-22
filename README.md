Instagram Challenge
==================

Maker's Academy weekend challenge to recreate a popular app that allows a user to post pictures of their brunch.

The app is deployed on heroku at https://powerful-fortress-65722.herokuapp.com/.
Uploaded images are hosted on Amazon S3, since heroku doesn't support permanent storage of files.


Technologies used
-------

- Ruby on Rails
- Heroku
- Amazon S3
- Carrierwave gem (to handle uploading of files)
- Fog gem (to handle storage of files in S3)
- Devise gem (to handle user authentication)


Requirements 
-------

#### Running locally for development:

+ PostgreSQL installed
+ A local postgres database named 'railstagram_development'
+ Rails >5.1

All gem requirements can be installed by installing the bundler gem (`gem install bundle`) and then running `bundle install` in the project directory.

#### Using the deployed app on heroku: 
+ None


Instructions
-------

#### Running locally for development:

- Launch the site: run `rails server` in the project root folder
- Navigate to  http://localhost:3000 in your browser

#### Using the deployed app on heroku: 

+ Visit the webpage: https://powerful-fortress-65722.herokuapp.com/

#### Once the app is launched:

+ You'll see the homepage with a feed of existing posts
+ Click 'Log in' button to log into your account to begin posting or commenting 
+ If you don't have an account, you'll see a button ('Sign up') which will allow you to register. Ensure you pick a unique username and email address.
+ Once you're signed in, post away!


User Stories implemented
-------

- Users can register with the site, and log in/out
- Users can post images with a description and see these appear in the feed
- Users can edit or delete their own posts
- Users can comment on other people's posts (or their own), either from the feed or the post itself
- Users can edit or delete their own comments
- Users can like and unlike posts


To do / possible extension work
-------

- Add real usernames
- Make adding/deleting comments + likes AJAX, so user doesn't lose place in feed
- Add user profile page, which shows all posts by that user
- Add user profile pictures / bio info
- Add hashtags & search by hashtag
