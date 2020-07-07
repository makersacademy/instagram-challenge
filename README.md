Instagram Challenge
===================
This is a weekend challenge I did during Week 8 at Makers Academy.

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

## Technologies used (plan)

* Node.js
* Express
* MongoDB, mongoose
* Cypress for testing
* React

## CRC Cards

| Collection | Keys |
|-----|-----|
| Users | username |
| | email |
| | password |
| Pictures | user_id|
| Comments | user_id|
|| content|

## My approach
1. Initialised project with Node, Express, Cypress
2. Created 1st test
3. Set up express server
4. Set up main, posts and signup routes, public folder, and passed tests for these. Added nodemon.
5. Added React (with CDN), and created Form component.
6. Added controllers
7. Added file upload functionality to server
8. Added Jest testing framework
9. Connected to MongoDB/mongoose
10. Added image upload to MongoDB
11. Added image read from MongoDB
12. Added username, caption and date to posts

## How to use

* Clone this repo
* Run the server
  ```
  node app.js
  ```
* Navigate to `localhost:3000` in your browser

## How to run the tests

* Start the server if it is not running already
  ```
  node app.js
  ```
* Open a new terminal window
* Navigate to the folder and run `npx cypress open` in the terminal, this will run the feature tests
* run `npm run test` in the terminal, this will run the unit tests
