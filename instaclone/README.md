### Once logged in
##### Posting images
```
I want to be able to upload images from my device to my feed
I want to be able to add tags to each image I post
I want to be able to add a description to each image I post
I want to be able to edit images I have uploaded
I want to be able to delete images I have uploaded
I want to be able to delete comments I have made
I want each image to receive comments from any user including me
```
##### Viewing images
```
I want to view a feed of all images posted on the app
I want to be able to view a feed displaying only the images posted by a certain user
I want to be able to search for and view a feed of images by tags
I want to be able to choose to follow certain users and then view a personalised feed of images they have posted
```
##### Account management
```
I want to be able to create an account
I want to be able to log in using Facebook
I want to be able to remove my Facebook account from the app
I want to be able to sign out
I want to be able to delete my account
```
----
#### Outline of approach:

MVP1
* Create Rails app
* User account creation, login, logout
* User can add an image with description and tags
* Homepage is a feed of all uploaded images with username and first 50char of description

MVP2
* Click on an image to view its own page with description, comments
* Any user can comment on an image
* Facebook account integration

MVP3
* Can search images by tag and view in a feed (Bookmark challenge)
* Can follow users
* Homepage displays personalised feed from those you follow
----
Some details about running the app:
* Ruby version: 2.2.6

* Database creation - rails initialised with postgreSQL, also using Devise, omniauth. You'll probably need to do a rake db:migrate.

* To run the app, clone the repository and cd into /instaclone/instaclone. Run ```bin/rails s``` on the command line, and go to http://localhost:3000/photos in your browser.

* How to run the test suite - cd into instaclone, and run rspec from the command line.
