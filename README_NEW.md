# * C H A Z Z Y G R A M *

An Instagram imitation

## How to use
Download files and run bundle install, and rails db:migrate
Run rails server
Go to http://localhost:3000/posts/new to add a new post
Go to http://localhost:3000/posts to see the existing post(s)

## Where the project is right now
- You can add a post with an image, description and hard code a location and username. 
- You can see, edit and delete the post.

I spent some time working through the [Rails getting started tutorial](https://guides.rubyonrails.org/getting_started.html) which was very good, but meant I ran out of time to get my actual application working as planned. Below is what I will do next. 

To do: 
- Work out how to use the testing functions for rails, write tests.
- Make the image square and resize it to be small enough to load quickly at the point of adding it.
- Get Devise working to do authentication and sessions so that username doesn't have to be hard coded.

## User Stories
```
As a user who loves to reminisce
So that I can remember what I thought about that picture at the time
I would like to be able to add a description and location to my photos

As a snappy dresser
So that I can show off what I’ve worn today
I would like to add my photos to Chazzygram linked to my username

As a snazzy socialite
So that I can log in securely to Chazzygram
I would like to have an account with my username and password

As a snazzy socialite
So that I feel at home on my phone
I would like Chazzygram to be aesthetically awesome

As an aesthetically driven social media user
So that my feed of photos looks great
I would like Chazzygram to make my photos square

As a snazzy socialite
So that I can check in with my friends and other people
I would like to leave comments and like photos

As a person who enjoys a friendship group and not the public
So that I can only see photos from people who interest me
I would like to choose to see photos from myself or my friends

As an aesthetically driven social media user
So that I can edit my photos a bit in the app
I would like the option to zoom in and out of the photo I upload before posting
```

## Technologies used
This project is built in Ruby on Rails. It also uses:
- Bootstrap for help making it pretty quickly
- Devise for help with authentication and sessions easily

