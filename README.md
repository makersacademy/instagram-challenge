Instagram Challenge
===================

Approach
-------

Instagram challenge was an exercise in creating a RESTful Rails application. Technologies used were Rails, Rspec, PostgreSQL, jQuery, Capybara, Shoulda & Poltergeist. Devise and Omniauth gems were used for user login and authentication. This app was developed in a behaviour driven way.

I started by enabling users to upload photos and view full-size images ('show' method). I allowed users to comment on photos and ensured comments were removed from the database when the relevant photo was deleted using `has_many :comments, dependent: :destroy`. I added a user login and prevented guest users from commenting on, deleting, editing or adding photos using `before_action :authenticate_user!, :except => [:index, :show]`. I added a 'likes' feature which updates in real-time using jQuery and prevented users from liking the same photo more than once using a database association through the photos table `has_many :liked_photos, through: :likes, source: :photo`.

How to Run
-----
Please ensure you have postgresql installed. If you don't, follow <a href="http://www.natalie-akam.com/Blog/psql.html">these instructions</a> before proceeding.

Clone this repo. Make sure you are in the correct directory for this project, then type these commands into terminal:

* brew install imagemagick
* brew install phantomjs
* bundle
* bin/rake db:create RAILS_ENV=development
* bin/rake db:create RAILS_ENV=test
* bin/rake db:migrate RAILS_ENV=development
* bin/rake db:migrate RAILS_ENV=test
* rails s

Then navigate to http://localhost:3000/ in your browser of choice.

ENJOY!


Tests
-----

    commenting
      adding a new comment
        allows users to comment using a form
        form must not be blank
        must be logged in
      deleting a comment
        can delete own comment

    liking photos
      photo has 0 likes initially
      a user can like a photo

    photos
      no photos have been added
        prompts user to upload a photo
      adding a new photo
        allows user to upload a photo
        photo must be provided
        denied if not logged in
      viewing photos
        allows user to view full-size photos
      deleting photos
        removes photo when owner clicks delete link

    User can sign in and out
      user not signed in and on the homepage
        should see a 'sign in' link and a 'sign up' link
        should not see 'sign out' link
      user signed in on the homepage
        should see 'sign out' link
        should not see a 'sign in' link and a 'sign up' link

    Comment
      should belong to photo
      comment must be provided

    Photo
      should have many comments dependent => destroy
      should belong to user
      link must be provided
      build_with_user
        builds a like
        builds a like associated with the specified user

    User
      should have many photos
      should have many comments
      should have many liked_photos
