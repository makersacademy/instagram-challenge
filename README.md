Instagram Challenge
===================

**Author:** Omar Alvarez

Task
----

Build a clone of Instagram that fulfills the following features:

#####Basic features
* Users can post pictures
* Users can write comments on pictures
* Users can like a picture
* Styled awesomely

#####Bonus features
* Filters
* Deployed to Heroku

Instructions
------------

From a user perspective, these are the instructions for how to download and run the tests:

```sh
 $ git clone git@github.com:omajul85/instagram-challenge.git
 $ cd instagram-challenge/
 $ bundle install
 $ bin/rake db:setup
 $ rspec
```
To run the app:
```sh
$ bin/rails s
```
Then go to `http://localhost:3000/` in the browser oy your preference. 

You need to sign up before uploading new pictures, post comments, like pictures, etc. The images below shows the user's interaction:

* Index page where users can see the uploaded pictures, click on button to add comment and like it.
![Index](http://s19.postimg.org/z31utvawj/Index.png)

* When clicking on an image, user can see the individual image (show view), add comments, and like the picture.
![Show](http://s19.postimg.org/4n0j9her7/Show.png)

* When clicking on `My pictures`, user list the uploaded images and can edit/delete them.
![My pictures](http://s19.postimg.org/87wespjar/My_pictures.png)

Deployment
----------

The application has been pushed to Heroku using Git. You can use it <a href="https://instagram-omajul85.herokuapp.com/" target="_blank">here</a>.

Some interesting Gems used on this project
------------------------------------------

* **devise:** Flexible authentication solution for Rails with Warden
* **carrierwave:** Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends. Carrierwave has been configured to work with Cloudinary.
* **cloudinary:** Client library for easily using the Cloudinary service, which is the one used for store the uploaded images on the cloud.
* **acts_as_votable:** Allows records to be votable. In this project, this is used to manage likes on pictures.
* **bootstrap-sass:** Sass-powered version of Bootstrap 3, used to style the application.