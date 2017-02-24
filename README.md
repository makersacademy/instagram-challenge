Instagram Challenge
===================

This is a weekend project we had been given at the end of our first Ruby on Rails week.

Feature
-------
* user sign up / in / out
* user post pic
* user like
* user comment

Installation:
-----
bin/rake db:create
bundle  

User Story
-----

USER STORY 1  
As a user,  
So to create my profile,  
I want to sign up  
CRITERIA:  
- fields email & password  
- both required  
- email is unique  

USER STORY 2  
As a user,  
So to access my profile,  
I want to sign in  
CRITERIA:  
- fields email & password  

USER STORY 3  
As a user,  
So to not let strangers use my profile,  
I want to sign out  

USER STORY 4  
As a user,  
So to inform world about my pleasant life,  
I want to share a pictures  
CRITERIA:  
- picture must be a picture!  
- pictures max size 640x480  
- all users can see any user picture  

USER STORY 5  
As a user,  
So to encourage other users in their pleasant life,  
I want to endorse them by clicking a Like button on their pictures  
CRITERIA:  
- owner and all other user can like pictures

USER STORY 6  
As a user,  
So to encourage other users in their pleasant life,  
I want to comment their pictures  
CRITERIA:  
- owner and all other user can comment pictures  
