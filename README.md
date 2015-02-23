Instagram Challenge
===================

Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your challenge solution by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. It will need to look like the instagrams website or better. 

Breakdown of models:
- User
- Post
- Comment/description
- Like

Bonus if you can add filters :P 

#Andy's Comments
Issues to resolve:
------------------
- S3 storage of images in development and prouction environments (getting error message from AWS)
- Failing test to check that images displayed can't find CSS element (though same approach worked on yelp project)

Features to add:
----------------
- Unit tests for validations of entry types
- before_action :authenticate_user!, except => [] for comments, digs
- AJAX for 'digging' a snapshot
- Twitter authenticated sign in
- Further styling

