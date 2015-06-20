Instagram Challenge
===================

Task
-----

Build Instagram using Rails.

Core Functionality
------------------

Users 
----
     - can sign up, sign in manually or via Facebook authentication - ✓  
     - can post photos with title and description - ✓  
     - can comment on photos  
     - can 'like' photos  

Photos
-----
     - display on the homepage - ✓  
     - are stored - ✓  
     - Can be commented on and liked  

Bonus Functionality
-------------------

Users
-----
     - can sign up/in via Twitter  
     - can tag photos with Twitter handles  
     - can share images via social media  
     - can edit/delete their submissions  
     - can like/unlike a photo  

Photos 
------
     - display in reverse chronological order  
     - show when they were added to the site, in plain english (e.g 'One hour ago')  
     - Carry a 'Like' counter reflecting number of likes  
       
Technologies
------------

Built on - Rails  
Tested with - Rspec, Capybara and Shoulda  
ORM - ActiveRecord  
Image management - Paperclip, Imagemagick, AWS S3  
Authentication - Devise, OmniAuth  
