Instagram Challenge
==================

Maker's Academy weekend challenge to recreate a popular app that allows a user to post pictures of their brunch.

The app is deployed on heroku at https://powerful-fortress-65722.herokuapp.com/
Uploaded images are hosted on Amazon S3

Requirements 
-------

#### Running locally for development:

+ PostgreSQL installed
+ A local postgres database named 'railstagram_development'
+ Rails >5.1

All gem requirements can be installed by installing the bundler gem (`gem install bundle`) and then running `bundle install` in the project directory.

#### Using the deployed app on heroku: 
+ None


User Stories implemented
-------

- Users can register with the site, and log in/out
- Users can post images with a description and see these appear in the feed
- Users can edit or delete their own posts
- Users can comment on other people's posts (or their own)
- Users can edit or delete their own comments
- Users can like and unlike posts

#### To do

- Styling

Instructions
-------

#### Running locally for development:

- Launch the site: run `rackup` in the project root folder
- Navigate to  http://localhost:9292 in your browser


#### Using the deployed app on heroku: 

+ Visit the webpage: https://infinite-river-43450.herokuapp.com

#### Once the app is launched:

+ You'll see the homepage with a feed of existing posts
+ Click 'Log in' button to log into your account to begin posting or commenting 
+ If you don't have an account, you'll see a button ('Sign up') which will allow you to register. Ensure you pick a unique username and email address.
+ Once you're signed in, post away!


