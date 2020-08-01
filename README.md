Instagram Challenge - Photogram
===================
This Ruby on Rails web app is a clone of Instagram. Currently the user is able to signup and only login if the correct email & password are entered. The user can also logout of the app. 

Developer's Notes:
---

- I am pleased with the project so far and feel like I have gained a better understanding of Rails and the interaction of all the files/routes. I struggled with updating the   database once it was initially created and migrated into my local database, therefore I was not able to add and view a new post once submitted (User Story 3). 

- User Stories 1 and 2 have been completed however functionality still needs to be added to complete User Stories 3, 4 & 5. 

- No tests have been written as of yet and this is something that I would like to work on once I have an even better understanding of Rails. 

- If I had completed all the User Stories I would have also liked to add in CSS styling. 

**User Stories**
----
```
As a user
So I can use the Photogram web app
I would like to be able to signup to create an account

As a user
So I can use the Photogram web app
I would like to be able to login to the web app with the email & password I signed up with

As a user
So I can show other users my photos
I would like to be able to upload a photo and add a caption to the photo feed

As a user
So I can write friendly messages
I would like to be able to leave comments on all posts

As a user 
So I can show my appreciation for a good photo
I would like to be able to 'like' a photo
```

**Wireframe**
----

![Wireframe](/wireframe.png)

**Setup Instructions**
----

To setup the repository in your local machine and migrate the database run the following commands in your terminal:

```
$ git clone https://github.com/Dhara-95/instagram-challenge.git
$ cd photogram_app
$ bundle install
$ rails db:migrate
```

To view the app, paste the following url into your web broswer (Chrome advised):

```
http://localhost:3000/
```
