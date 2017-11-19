Instagram Challenge
===================

## Task

This repository contains a Makers Academy home assignment. The challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to get started

On your terminal command, clone this repo and update the gems with the following command :

```
git clone git@github.com:Pablo123GitHub/instagram-challenge.git
cd instagram-challenge
bundle install
rails server
```

The above last command will fire up your local browser on port 3000, so you can go to http://localhost:3000/ to start using this rails app.


## Technology used

- Rails 5.1
- Ruby
- Rubocop for linting


## How this app could be improved ?

- When I add a new comment I would like to fill the commenter field automatically. In order to do this, I should add a username to the User model (I currently only have email), and then I could make use of this name to fill it out automatically.

- I have use the acts_as_votable gem to create the Upvote/Downvote feature ...but maybe I could have my own "Like" model which would have  been more of a challenge, as this model would have to interact with the User, the Post, and the Comment model in order to make sure that the votes are being correctly accounted for.
