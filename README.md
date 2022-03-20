Instagram Challenge
===================

## Approach by Claire Nelson

Whilst all the Makers documentation discusses developing this challenge using Ruby On Rails we were asked to build it using the MERN Stack (Mongo, Express, React and Node).

I am investigating using Multer to upload photos. Installed using the command: npm install multer multer-gridfs-storage
- [Storing images](https://www.bezkoder.com/node-js-upload-store-images-mongodb/#Create_middleware_for_uploading_038_storing_image)


#### Break down the requirements 

- Break down what is required in this challenge to create [user stories](https://github.com/nelsonclaire/instagram-challenge/blob/master/task_stories/user_stories.md) which should assist with how to create the tests, classes and methods.


## Technologies used

This is a Node.js engineering project.

It uses:

- [Express](https://expressjs.com/) web framework for Node.js.
- [Nodemon](https://nodemon.io/) to reload the server automatically.
- [Handlebars](https://handlebarsjs.com/) to render view templates.
- [Mongoose](https://mongoosejs.com) to model objects in MongoDB.
- [ESLint](https://eslint.org) for linting.
- [Jest](https://jestjs.io/) for testing.
- [Cypress](https://www.cypress.io/) for end-to-end testing.


## Quickstart

### Install Node.js

1. Install Node Version Manager (NVM)
   ```
   brew install nvm
   ```
   Then follow the instructions to update your `~/.bash_profile`.
2. Open a new terminal
3. Install the latest long term support (LTS) version of [Node.js](https://nodejs.org/en/), currently `17.7.1`.
   ```
   nvm install 16
   ```

### Steps to set up your project and download

1. Fork this [repo](https://github.com/nelsonclaire/instagram-challenge)

2. `git clone git@github.com:<userName>/instagram-challenge.git` onto your local machine
3. Install Node.js dependencies
   ```
   npm install
   ```
4. Install an ESLint plugin for your editor. For example: [linter-eslint](https://github.com/AtomLinter/linter-eslint) for Atom. See below.

5. Install MongoDB
   ```
   brew tap mongodb/brew
   brew install mongodb-community@5.0
   ```
6. Start MongoDB
   ```
   brew services start mongodb-community@5.0
   ```

### Start

1. Start the server
   ```
   npm start
   ```
2. Browse to [http://127.0.0.1:3000](http://127.0.0.1:3000)

### Test

- Run all tests
  ```
  npm test
  ```
- Run a check
  ```bash
  npm run lint              # linter only
  npm run test:unit         # unit tests only
  npm run test:integration  # integration tests only
  ```

#### Start test server

The server must be running locally with test configuration for the
integration tests to pass.

```
npm run start:test
```

This starts the server on port `3030` and uses the test MongoDB database,
so that integration tests do not interact with the development server.


## To install ESLint

1. Run `npm install eslint --save-dev`

2. Install configuration file by running `npm init @eslint/config` (do this after you have package.json installed by running `npm init`)

3. Run `npx eslint yourfile.js` directly in root of your local project

## My approach

1. Break down into simple steps 

2. Write first unit test 

3. Follow red, green, refactor cycle for each test with commits before a refactor

4. Continue with simple tests 

5. Repeat until basic user story functionality is covered




----------------------------------------------------------------------------------------------------------------------------------------------------


## Instructions

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

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
group :development, :test do
  gem 'rubocop', '1.20', require: false
  gem 'rubocop-rails'
end
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
