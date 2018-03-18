README Edit: My approach and code review
=================

My approach
------
Pre-code:
* First, I divided the whole challenge into User Stories:

```
As a web surfer
So that I can start using Finchstagram
I want to be able to register and log in

As a user
So that I can share my moments with others
I want to be able to post pictures

As a user
So that I can give my opinion about pictures
I want to be able to write comments

As a user
So that I can indicate that I enjoyed a posted picture
I want to be able to like it
```

* Then, I worked on the Domain Modelling. To achieve my MVP for this challenge I would need two models:
Users that can post **pictures** and pictures that can have **comments** and likes
* I wrote down the specific attributes my models would need and also the relations among them:

**MVP**

```
Pictures (can have many comments)
- pic:string
- description: string

Comments (belong to a specific picture)
- comment:string
```

Development:
* I started by creating the Picture model. First, I wrote feature tests for the whole CRUD to make sure the user can add pictures and see them on the index, delete and update them.
* Then, I created the Comment model and tested it.


**MVP 2**

```
Users (can have many pictures)

[TBC]

```



Next focus
------
[TBC]

Personal code review
------
* I could have probably started the challenge with the authentication, as everything is based on it. Anonymous users should not have access to posting pictures, commenting on them or even liking them.

Screenshots
------
[TBC]



Instagram Challenge
===================

## Instructions

* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
