Instagram Challenge
===================

**Deployed on heroku: https://aa-instaclone.herokuapp.com**

What is it?
-------
A basic Instagram clone. Users are able to post pictures, comments and likes.
Made with Rails and Postgres.

User Stories
-----

```
Feature - Authentication

As a user
So i can use the website securely
I want to be able to register a new account

As a user
So i can use the website securely
I want to be able to login with my account

As a user
So i can use the website securely
I want to be able to post only if I'm logged in

As a user
So i will never be locked out
I want to be able to reset my password

```

```
Feature - Posts

As a user
So i can share my photos
I want to be able to post them

As a user
So i can manage my posts
I want to be able to edit and delete them

As a user
So i can comment on photos
I want to be able to comment on any posted photo

As a user
So i can show that i like a photo
I want to be able to like a photo with a button

As a user
So i can take my like back
I want to be able to unlike a photo

```

```
Feature - Authorization

As a user
So i can be sure my posts are secure
I want other users not to be able to edit or delete my posts.

```

Build Process
----

Created the above user stories to follow a BDD life cycle. Used Capybara to TDD
this project. The most challenging part was the table associations, for every
user to have posts and the posts to have likes and also linked to users. Rails
guides as well as Stack Overflow helped me find my solutions.


To DOs
----
* Use Ajax on requests to avoid page refreshes
* Add AWS S3 to outsource my pictures
* Add Oauth for easier logins
* Use Javascript for a better front end.
