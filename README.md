To begin using this App please go to http://localhost:3000/users/sign_up. (created using gem devise).
To essential steps are required to run the rails server and open the app. Please follow these steps first:
$ bundle install
$ bin/rails db:setup

This is a partial weekend challenge (MVP) [registering and sign in/out with Devise, adding, deleting, viewing and updating photos].
This project taught me about the Request - response cycle diagram (get /pictures), MVC diagram
I used command line rails to generate a view, a controller, a model, and add routes | rake db:migrate.

One important rails command I used was rails generate scaffold NAME_OF_MODEL. Scaffold in Rais being a full set of model, database migration for that model, controller to manipulate it, views to view and manipulate the data, and a test suite for each of the above.

The gem carrierwave and Mini_Magick(to resize images) has been implemented in order to upload images from file. It can be accessed from the server URL http://localhost:3000/photos. Adjustments need to be made.
