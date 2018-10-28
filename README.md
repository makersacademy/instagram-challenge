# README

Simple challenge, build instagram using Rails! Well it's some of the way there, there's more work I'd like to put into it but at the moment you can see the deployed site on Heroku here:

https://morning-lowlands-26385.herokuapp.com/

I have to admit this hasn't actually been TDD'ed, I know I'll get slammed for it if it gets code reviewed but oh well. I don't feel 100% like I'm sure what's going on with rails and I took this weekend challenge as a "Have a play with rails and some CSS and see what you can get done" which it seems to have done pretty well. I'm relatively pleased with the outcome, but intend to put more work into it as well.

## How to use

1. clone this repo
2. move into the folder and run `bundle install`
3a. create the databases using `db:create`
3b. migrate the databases using `bin/rails db:migrate`
4. start your server with the command `bin/rails s`
5. visit localhost:3000
6. sign up for an account

## Current Features

- The application allows users to sign in/out through the magic of the 'devise' gem.
- Users are able to post pictures with a short description through the magic of the 'paperclip' gem
- Only users who sign in are allowed to see any pictures or post any pictures. Anyone not signed in will be returned to the login page and prompted to log in
- Users are able to visit each picture they want and see the user who created it
- Users are able to delete their photos if they no longer wish to have them there

## Stuff to do

- Add ability for users to comment on pictures (already partly done, databases are set up I just need to work out how to set the forms for comments up properly)
- Add ability to like images
- Add feature that shows the number of likes upon hovering over a photo
- Add users profile page, showing list of all their photos. Include links to their profile page
- Write Some Tests!
