**Instagram Challenge**
===================

**Functionality implemented**
-------

* Use can sign up, sign in and sign out.  Nav bar displays confirmation of user email when logged in.  No ability to use omniauth to sign in at present, though this would be relatively easy to fit in at a later point.
* Able to post pictures, fixed square of 500px side length, will crop but fill square if aspect ratio is not square.  You can click on the images themselves to view the original size (this can cause problems with the formatting of the page if the image is particularly large)
* Users can like images, currently this is only implemented to display in the image description.
* Users can comment on images.

**How to run a local version**
-----------

* git clone https://github.com/k0zakinio/instagram-challenge
* bundle install
* rake andygram_setup

You should now be able to run a local server/run rspec tests.