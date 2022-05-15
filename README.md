Instagram Challenge
===================

This app is a copy of instagram written in Javascript. Express was used to create the server and routes, Mongodb is the database where the data is stored and mongoose was used to connect the two together.

All the necessary files for this app have been separated into appropriate folders. The [views](https://github.com/jmcnally17/instagram-challenge/tree/main/views) folder contains the HBS files that contain the HTML code for each page. The [routes](https://github.com/jmcnally17/instagram-challenge/tree/main/routes) folder contains the defined routes for each group of objects that govern HTTP requests throughout the app, with help from the [controllers](https://github.com/jmcnally17/instagram-challenge/tree/main/controllers) folder. Finally, the object classes are defined in the [models](https://github.com/jmcnally17/instagram-challenge/tree/main/models) folder, which use Mongoose to create the necessary Schema which define the classes themselves. These Schema also determine what information gets stored in the database.

So far, the functionality is limited due to not having a lot of time to work on this project.

## Getting Started

If you haven't already, install nvm using homebrew:

```
brew install nvm
```

Then, open a new terminal and install Node.js:

```
nvm install node
```

Now you can clone this repository and install the necessary dependencies:

```
git clone https://github.com/jmcnally17/instagram-challenge
npm install
```

Mongodb needs to be installed and started as well:

```
brew tap mongodb/brew
brew install mongodb-community@5.0
brew services start mongodb-community@5.0
```

## How To Use

To start using the app, start by running the server using:

```
npm start
```

Then, in your browser, enter `localhost:3000` in the address bar to visit the site. There, you can sign up, log in, log out and post image URLs that will be rendered on the posts page, which you can only visit when you are signed in.

## Testing

Jest was used for unit tests which applied to the models, while Cypress carried out integration tests to mimic user input in order to see the correct results were displayed on the pages. To run the unit tests, simply enter `jest` or `npm run test:unit` into the terminal. In order to run the integration tests, first the test server needs to be run by entering:

```
npm run start:test
```

Then the integration tests can be initiated by entering:

```
npm run test:integration
```

All tests can be ran together at once by simply entering `npm test` into the terminal *(remember the integration tests will need the test server to be runnning in order for them to pass)*.

## Improvements

Had I had more time, I would have liked to implement the following functionality:

1. Users cannot sign up with existing emails and passwords would be encrypted
2. Posts would be linked with the user who posted it via a foreign key.
3. Image files could be uploaded to the site instead of having to enter the URL for an existing photo on the internet.
4. Photos can be liked and commented on.
5. Posts can be deleted.
6. Bonus: add filters to posts.
