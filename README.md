Instagram Challenge
===================

This is the current build of my Instagram-inspired website. The basic functionality
is in place, although there are some additional features yet to be added. Namely:

* Visual formatting
* "Follow" functionality, with only photos from followed users appearing on a timeline.
* Ability to add comment on /photos page, and have the display update via JQuery.
* Profile page with a user's uploaded photos.
* Edit/update password and user details.
* User profile photo.

Installation Instructions
-------
* Clone this repo.
* Enter the cloned repo and run ```bundle install```
* Open terminal and open psql. i.e. ```psql postgres```
* Create a database for test. i.e. ```CREATE DATABASE instamatt_test```
* Create a database for development. i.e. ```CREATE DATABASE instamatt_development```
* Exit psql - ```\q``` - and migrate the database - ```rake db:migrate```
* In browser, go to http://localhost:3000
* From this page, you can sign up, sign in, add a photo or view existing photos.
