Instagram Challenge
===================

Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your challenge solution (or partial solution) by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

As usual please start by

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
* Forking this repo

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. It will need to look like the instagrams website or better. 

Breakdown of models:
- User
- Post
- Comment/description
- Like

Bonus if you can add filters :P 

# Nadav's notes:

## plan

* Using the MVP principle, I should have something working, all the time

* Before finishing all features, I should attempt styleing and deployment

## user stories

MVP #1
- users can post photos (like chitter)
- users can sign up, sign in and sign out out 

MVP #2 
- looks nice 
- deployed on AWS

MVP #3 
- users can add description and comments

MVP #4 
- users can add likes



* Users can upload new photos using a form adding description

* Photos can be deleted

* descriptions can be edited and deleted

* Userss can leave comments for photos

*The photos listings page should display all the comments

* Validations should be in place for the photo, description, and comments formst - [ TBD restaurants must be given a name and rating, reviews must be given a rating from 1-5 (comment is optional)] 

* Users can register/login

* User must be logged in to upload a photo

* Users can only edit/delete photos and comments which they've created

* Users can leave many comments per photo

* Users can delete their own comments

* Some indication should be given on the page (as part of the layout) whether the user is currently logged in, along with links to the available actions (i.e. Logout/Edit account is signed in, otherwise Sign In/Sign Up)

* The user name of the poster / commenter should be displayed as part of the description, comment

* Currently, when writing a review, we have to go to a separate page and trigger a page refresh. Migrate the functionality to happen asynchronously with AJAX. We'll also have to set up Poltergeist to enable us to run JS-enabled tests.

* Use CSS to enhance the overall design of the site

* Refactor your more complex views to use partials

* Users can like a photo
