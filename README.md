Instagram Challenge
===================
This is a basic functional recreation of Instagram, whereby users can sign-up to the service and create, read, update and delete images. Users can also like and comment on images.

Technologies used
--------------
It was written in Ruby using the Rails MVC framework, using Devise for user authentication, RSpec for testing, and a Postgres database.

Installation instructions
----------
````
$ git clone git@github.com:francesmx/instagram-challenge.git
$ cd instagram-challenge
$ bundle
$ rake db:setup
````
You can view tests:
````
$ rspec
````
To play with the app using the web interface, start the server:
````
$ rails server
$ open http://localhost:3000
````

Screenshots
---------
Homepage:
![Homepage](http://i.imgur.com/yH7YMKD.png)

Picture:
![Picture](http://i.imgur.com/FGeQcBg.png)

Features
----
* Users can sign up, in and out
* Users can post pictures
* Users can edit pictures
* Users can delete pictures
* Users can comment on pictures
* Users cannot post, edit, delete or comment unless signed in
* Users can like pictures

Still to be implemented
--------
* Include username (so it can be shown alongside the image)
* Users can only edit their own pictures
* Users can only delete their own pictures
* Users can edit (only) their comments
* Users can delete (only) their comments
* Users can unlike pictures
* Improve testing using FactoryGirl
* Use Amazon web services to store images
* Use AJAX instead of page refreshes
* Users can add filters to images
* See comments and likes on the index page instead of having to click through
* Users can edit their profiles
* Deploy to Heroku
