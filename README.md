Instagram Challenge
===================

About
----

This is the Week 8 Makers Acadmey Challenge, built in one weekend. The challenge was to build Instagram using Ruby on Rails. 

How to use
-----
1. Clone this repo
2. `$ cd instagram-challenge`
3. `$ bundle install`
4. `$ rails server`
5. Go to [localhost:3000](http://localhost:3000) in your browser

User Stories
-----
```
As a user
So I can share my favourite images with the world
I want to be able to post pictures
```
```
As a user
So I can tell people what I think
I want to be able to comment on pictures
```
```
As a user
So I can show my appreciation for a picture
I want to be able to 'like' it
```
```
As a user
So I can keep my favourite pictures up to date
I want to be able to delete a picture
```

Approach
-----
- I began by creating the above user stories to satisfy the brief
- I then set up my Rails application
- For each user story, I used TDD to write my code and create the features
- I researched and included several Ruby gems e.g. *paperclip* for uploading images, and *will_paginate* to include pagination
- I added CSS styling to make the application nicer for the user

Additional features
-----
Due to the time constraints of this challenge, there were several features I wanted to include but was unable to implement:

- Users should sign up and log in for in order to interact with the site
- User can filter images based on number of comments, or number of likes
- Only user who added picture is able to delete it
- User can generate a list of images they've liked


