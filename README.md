Instagram Challenge
==================

Brief Summary of Approach
-------

I followed the same approach we used in the week, in order to build Jennstagram.  Rails does most of the work, so the important role for me is simply working out what the next steps are in logic and how to implement them.  

Points for development:
* ensure full test coverage with rspec
* add fully connected comments facility
* add like button
* deploy to heroku

Instructions
-------

* Clone this repository
* cd jennstagram
* Run the command 'bundle' in the project directory to ensure you have all the gems
* bin/rails automigrate
* bin/rails s (navigate to localhost:3000 in your choice of browser)

User stories
--------
```
As a user
So that I can share my life with the world
I would like to post a photo with a caption

As a user
So that I can have ownership over my posts
I would like to create an account and sign in

As a user
So that I can tell others how cool their life is
I would like to comment on their posts

As a user
So that I can encourage my friends
I would like to like their posts
```

Technologies Used:
--------
* RSpec
* Rails
* Active Record
* Devise (for user accounts)
* bcrypt (for password encryption)
