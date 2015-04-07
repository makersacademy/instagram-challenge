Instagram Challenge
===================

My clone of the instagram web app written in Ruby on Rails.

Users can sign up/log in to upload there images and add comments. Images can be viewed and shown individually with their comments below.

Testing is done with rspec and capybara coving the core functionality.


Set up
-----
* Postgresql databases. Check database.yml for database names and create the databases.
* Run bundle install
* After you have created the databases run 'bin/rake db:migrate' and for your test environment run 'bin/rake db:migrate RAILS_ENV=test'.
* Paperclip gem is used for image upload, please refer to their docs for set up.

Future work
-----------
* Include like functionality
* Link user name to the comments
* Filter last 5 comments to the images on the index page.
* Option to show all or just the user's images on the index page