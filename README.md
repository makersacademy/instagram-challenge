Instagram Challenge
===================

This is my response to the Makers Instagram Challenge, which I wrote in Javascript. I completed a styled homepage which shows uploaded photos including name and description.
There is a separate page to upload photos.

It uses:

- [Express](https://expressjs.com/) web framework for Node.js.
- [Nodemon](https://nodemon.io/) to reload the server automatically.
- [Jade](https://handlebarsjs.com/) to render view templates.
- [Mongoose](https://mongoosejs.com) to model objects in MongoDB.
- [Jest](https://jestjs.io/) for testing.
- [Cypress](https://www.cypress.io/) for end-to-end testing.
- [Mutlter] for file storage.

## Examples of Use

![](public/images/page_with_neon.png?raw=true)

## Task I followed

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## My Planning: User Stories

Users

As an amateur photographer
So that I am remembered on the site
I would like to be able to sign up

As an amateur photographer
So that I can access my accounts
I would like to be able to sign in

As an amateur photographer
So that people cannot post photos as me
I would like to be able to log out

Posts

As an amateur photographer
So that I can share my work
I would like to be able to post an image on instagram

As an amateur photographer
So that I get credit for my photos
I would like my username to appear next to my photo

As an amateur photographer
So that I can avoid being embarrassed by old work
I would like to be able to delete my photos

As a photography fan
So that I can see what is happening now
I would like to see the most recent post first

Comments

As an amateur photographer
So that I can get feedback
I would like people to be able to comment on my work

As an amateur photographer
So that I get fewer rude comments
I would like to see the username of the person who posts a comment

Likes:

As a photography fan
So that I can show my appreciation
I would like to be able to like a photo

As a photography fan
So that I know what is truly popular
I want users to only be able to like a photo once

## To use the program

* Fork & Clone this repo
* Run `npm install` to install the dependencies
* `npm run start` to open the program in your browser (localhost/3000)

To run the tests:
* `npm run test:unit` to run only the unit tests
* `npm run start:test` followed by `npm run test:integration` to run the integration tests
