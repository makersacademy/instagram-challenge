Instagram Challenge - Eternagram
================================

## Task

Build Instagram:

This weekend challenge was to build Instagram using Rails. It required **users** who can post **pictures**, write **comments** on pictures and **like** a picture. The aim of this task was to practice the rails skills we acquired during week 8 of Makers Academy.

## Approach and Learning

I began by creating a Trello board to organise my work flow, as I believed this task would consume much of my weekend (I wasn't wrong!). This helped break down all the seemingly huge tasks into smaller manageable tasks, and increased my productivity immensely.

I decided to use the Devise gem to handle my user sign up, log in, and log out functionality, a gem I had used in the previous week with my team. I also decided to use Active Storage for the photo uploading functionality, as it went hand in hand with Rails' Active Record.

I also used the gem Acts_as_votable for my like/unlike functionality, which while somewhat confusing, ended up being very useful, and will likely help me next week when I continue on my team project.

Finally, I used factory_bot_rails to create objects for testing purposes.

I have managed to implement all the functionality apart from adding comments, however, when a user enters the site, they are prompted to sign in or sign up, after-which they are taken to the homepage where they can see all posts in reverse chronological order with the username of whoever posted them, a caption, and the number of likes.

I also added a 'profile' button to the header which takes a user to their profile page where only their specific posts are viewable.

I decided not to add the edit and delete features this weekend as I wanted to focus more on the functionality that I had not covered during the course week, however I may add these, along with the comments, in the near future.

I found TDD a difficult concept with Rails, often not knowing what to test, when, and if it was necessary. This is something I shall enquire about with the Makers coaches.

## User Stories:

```
As a user,
So that I can share the picture I have taken on Eternagram,
I would like to be able to post a picture.

As a user,
So that I can show my appreciation of other pictures,
I would like to be able to like a picture.

As a user,
So that I can tell someone what I think about their picture,
I would like to be able to comment on a picture.

As a user,
So that I can post pictures on Eternagram,
I would like to be able to sign up.

As a user,
So that I can post pictures as me,
I would like to be able to sign in to Eternagram.

As a user,
So that others cannot post as me from my device,
I would like to be able to sign out of Eternagram.
```

## Instructions

```
Clone this repository
```

```
Run $ bundle install
```

```
Run $ rake db: create
```

```
Run $ rake db: migrate
```

```
Run $ rails s
```

```
Open localhost:3000 in your browser
```
