## chitter-v2

- This is v2 of the chitter challenge where the task is to create a chitter clone that includes the user stories shown at the bottom of this page.
- It's an MVC app built using Node.js, Express and ejs. Jasmine is used for unit testing and cypress used for feature testing.
- You can see the production version of the app [here](https://shrouded-savannah-60836.herokuapp.com/posts).

Below are the steps to set everything up locally:

# Set up locally

## Create Database

In `psql` or `TablePlus` run the following query:

```
CREATE DATABASE chitter_v2;
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(200), password VARCHAR(200), email VARCHAR(200), photo_url VARCHAR(400) DEFAULT null);
CREATE TABLE posts(id SERIAL PRIMARY KEY, text VARCHAR(200), created_at TIMESTAMP DEFAULT now(), user_id integer REFERENCES users(id));
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(200), post_id integer REFERENCES posts(id), user_id integer REFERENCES users(id), created_at TIMESTAMP DEFAULT now());
CREATE TABLE likes(id SERIAL PRIMARY KEY, post_id integer REFERENCES posts(id), user_id integer REFERENCES users(id));
```

Then repeat the above for the test database: `chitter_v2_test`

You might want to create some initial data:

```
INSERT INTO users(username, password, email) VALUES('test', 'Password', 'test@test.com');
INSERT INTO posts(text, user_id) VALUES('this is the first post of chitter', 1);
INSERT INTO comments(text, post_id, user_id) VALUES('this is the first comment', 1, 1);
INSERT INTO likes(post_id, user_id) VALUES(1, 1);
```

## Install and run program (for development)

Clone this repo and navigate to its directory.

`npm install`

In the root directory of the project create a file called `.env` and copy the following (adapt where required):

```
DB_USER=<your_psql_name>
DB_HOST=localhost
DB_DATABASE=chitter_v2
DB_TEST_DATABASE=chitter_v2_test
DB_PASSWORD=null
DB_PORT=5432
```

To install nodemon on your machine, run the following command:

`npm install -g nodemon`

To run the app, run the following command:

`npm start`

Visit http://localhost:3000/

## Running tests with Jasmine

- Run `npm test`.
- When writing tests, include `Spec.js` on the end of the test file.

## Running Cypress

- When you run `npm run cypress:open` it will open Cypress and allow you to pick and choose which tests to run, or all.
- When writing tests, include `.spec.js` on the end of the test file.
- Store these files in `<project-name>/cypress/integration`.

### Running tests with Cypress

You will need to have mozilla firefox downloaded in order for cypress tests to work

`npm run cypress:open`

## User Stories

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
