# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

---------------

0 - imagemagick - website download, run 'which convert' in command line and should see      a path to where it's installed.

0 - databases: made 2, instaweekend & instaweekendtest : this led to updating the app/config/locales/database.yml
  - should create with a Users table, including an id, title, text.

0 - paperclip tutorial (https://github.com/thoughtbot/paperclip), gets you to edit the user table and include the avatar columns to the table, also guides you to change the controller's, models and view's.

0 - the view's didn't work for me until I had added the '.each do' method/loop to go over each individual image in the database, unlike how they describe it in the walkthrough on paperclip.
