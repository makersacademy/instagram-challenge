Instagram Challenge
===================

## Task

This repository contains a Makers Academy home assignment. The challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to get started

Clone this repo and update the gems with the following command (terminal)

```
- git clone - git@github.com:Pablo123GitHub/instagram-challenge.git
- cd instagram-challenge
- bundle install
- rails server
```

You will then need to go to your local browser on port 3000, http://localhost:3000/ to start using the app.


## Technology used

- Rails 5.1
- Ruby
- Rubocop for linting


## How this app could be improved ?

- I have installed the acts_as_votable gem to create the Upvote/Downvote feature ...but maybe I could have built my own "Like" model which would have  been more of a challenge, as this model would have had to interact with the User, the Post, and the Comment model in order to make sure that the "likes" are being correctly accounted for.

- I have not managed to find a solution to prevent the page from going to the top when we click on "like" or "dislike". I have tried to use preventDefault with JavaScript, but no luck there.
