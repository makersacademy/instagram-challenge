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

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!

## User stories
```
  As a user
  So I can view images of lint
  I would like to be able to visit lintstgram and see the images which have been posted

  As a user
  So I can add my picture of lint
  I would like to be able to add a picture to the website

  As a user
  So I can remove a picture from Lintstagram
  I would like to be able to click a delete button on the show page of a picture

  As a user
  So I can voice my opinions about lint
  I would like to be able to comment on pictures

  As a user
  So I can silently approve of specific pictures
  I would like to be able to 'like' pictures

  As a user
  So I can create an account
  I would like to be able to click a login button on the homepage

  As a user
  So I can log in to my account once it has been created
  I would like to be able to click a sign in button on the homepage

  As a signed in user
  So I can sign out
  I would like to be able to click a sign out button and be signed out
```

#### Structure
User:
- Fields
  - Username
  - Email address
  - Password
- Has many Pictures
- Has many Comments

Picture:
- Fields
  - Image
- Belongs to User
- Has many Comments

Comment:
- Fields
  - Body
- Belongs to User
- Belongs to Picture
