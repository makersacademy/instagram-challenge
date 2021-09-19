# instagram-challenge

Functionality implemented:

- can add users to the database
- can add "photos" (placeholder text) to the database - this requires the automatically generated user id at the moment, as there is no log in functionality

This was a steep learning curve: most of the technologies used were either very or completely new to me. I enjoyed setting up a node-express-sequelize/psql project, but found it tough going to move beyond basic API functionality. I learned a lot on this challenge, mostly a greater appreciation of what I don't yet know!

Things to learn / focus on in future:

- how to test a project like this properly: there are no unit tests - and my tests at the moment rely on a slow and twitchy test database routine. I need to learn how to mock the database calls and test these in jest.
- working with Express routes
- connecting the database content to the front end

If you want to run the program (it is _very_ basic), clone this repo, run `npm install`. Look at `server/config/config.json` for the settings - change the username accordingly (running the app or tests for the first time should build the databases automatically).

To see the website, type `npm start` in the terminal, hit return, and then visit `http://localhost:3000/`

To run the tests type `npm test` - they are quite 'experimental' and fragile and prone to failure.

It is easy to create a user via `http://localhost:3000/users/new` - user IDs are assigned sequentially, but can be checked via the databse using `psql`. You will need a valid ID number to add 'photos' via `http://localhost:3000/photos/new`. This app allows you to create new entries for both users and photos, but currently doesn't do much else!

## Technologies used

Node.js

Server: Express

Database: Postgres & Sequelize

Views: Handlebars - though I didn't get much time to think about front end during the weekend challenge.

Tests: Jest, , Supertest, Puppeteer, Postman

Linting: Prettier

## Task

Rebuild Instagram

Final Makers weekend challenge - using node.js instead of rails

## User Stories

```
As a user
So I can use Insta-sham
I would like to be able to create a user account

As a user
So I can store my photos online
I would like to upload an image to Insta-sham
```
