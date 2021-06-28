# Maker's Week 8: Weekend challenge
This challenge was the seventh of my Maker's weekend challenge, intended to be done alone to reinforce the week's learning and concepts.
The necessary skills covered in this challenge were:

* Build instagram with all the relevant features
* Build a full stack application in Rails
* Follow a TDD approach to a full stack application

Successes
-----
* Main Instagram MVP back end implemented with very little trouble
* Experimented with and successfully used Rails generation as well as manual MVC creation


To improve
-----
* An attempt to get bootstrap working for the front end created a major issue, and git rollback had a problem that ended up breaking the project,
        4 hours just to get back to basic working order and I had no time to finish the front end
* **This project is one I will rewrite post makers without bootstrap in order to have both a functional back end and front end**

[See this app run live at Heroku](https://still-fortress-76749.herokuapp.com/)


Instagram Challenge
===================

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).


```
STRAIGHT UP

As a User
So that I can show others my pictures 
I want to post a Jam to InstaJam

As a User
So that I can see other's pictures
I want to see all Jams most recent first

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a User
So that I can identify my own pictures
I want to sign up for InstaJam

HARDER

As a User
So that only I can post Jams as me
I want to log in to InstaJam

As a User
So that I can avoid others posting messages on InstaJam
I want to log out of Instajam

ADVANCED

As a Maker
So that people can see a demonstration of my app
I want to host it on Heroku
```

Setup:
-------

* Clone this repo, run bundle migrate to install any dependencies, run rails db:migrate to install your tables
* Use < rails s / rails server > command in terminal to launch Rails server, and go to http://127.0.0.1:3000/ to interact with the app
* Alternatively use < rackup > and go to localhost:9292
* Why not make it even easier for yourself and just click the Heroku link at the top?



