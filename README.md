Lintstagram
===================
A home for anyone who is enthusiastic about photos of lint. Built over the course of a single weekend.

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

## To use

```
$ git clone git@github.com:MatthewBurstein/Lintstagram.git
$ cd lintstagram
$ bundle install
$ rake db:seed
$ rails server
Now visit http://localhost:3000/ and check out the lint.
```

## Methodology

I broke the task down into user stories which I organised into groups, the first of which was an mvp, while subsequent groups constituted complete features.

Having done that, I set about building the app using the Rails tools we have learnt over the previous week. I followed TDD practices by beginning each user story with a feature test and then solving error messages until the story was complete.

Once the primary business logic was in place, I removed all unused routes and prepared seeds for the database so that it can be used 'out of the box' by anyone who wishes to.

Finally, I worked on styling the app and tidying up any loose ends.

## Technologies
- Ruby on Rails
- Devise
- HTML/CSS

Testing
- Capybara
- RSpec

## Continuation
Had I more time, I would be keen to work on:
- Improving the styling across the app, especially making it responsive and improving accessibility
- Allowing users to upload their own images of lint rather than only use images hosted elsewhere
- Add more information to user accounts, especially a profile picture to be displayed alongside their name.

## User stories

MVP
```
  As a user
  So I can view images of lint
  I would like to visit Lintstagram and see the images which have been posted

  As a user
  So I can add my picture of lint
  I would like to add a picture to the website

  As a user
  So I can remove a picture from Lintstagram
  I would like to click a delete button on the show page of a picture
```

Second feature: Users
```
  As a user
  So I can create an account
  I would like to click a sign up button at the top of the screen

  As a user
  So I can log in to my account once it has been created
  I would like to click a sign in button on the homepage

  As a user
  So my picture is safe
  I would like no other user to be able to delete it

  As a signed in user
  So I can sign out
  I would like to click a sign out button and be signed out

  As a user
  So I can see who owns some lint
  I would like to see the user's email address displayed by each picture
```

Third feature: Comments
```
  As a user
  So I can voice my opinions about lint
  I would like to comment on pictures

  As a user
  So I can change my mind
  I would like to delete a comment I have made

  As a user,
  So my comment is safe,
  I would like no other user to be able to delete it
```

Fourth feature: Likes

```
  As a user
  So I can express approval of approve of specific pictures
  I would like to 'like' pictures

  As a user
  So I know the system is fair
  I would like to not be able to like a picture I have already liked

  As a user
  So I can I change my mind
  I would like to unlike a picture
```
