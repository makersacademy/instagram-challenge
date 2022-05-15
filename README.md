# Instagram Challenge
```       
      .-------------------.
     /--"--.------.------/|
     |Kodak|__Ll__| [==] ||
     |     | .--. | """" ||
     |     |( () )|      ||
     |     | `--' |      |/
     `-----'------'------'
```

## Task
I have been tasked to create a web app that will work similar to Instagram - users will be able to sign up and be able to post pictures which can be liked and commented on.

## Instructions
Clone this repository to your desired location using `git clone https://github.com/mcsuGH/instagram-challenge.git`.\
\
Make sure you have the most recent update of Node and then you can run `npm install` whilst in the main directory in your terminal to install dependencies.\
\
You can run tests by using the command `npm run start:test` to load up the test server then using `npm test` to run the test files. Note that tests are dependent on being run like this - for example some integration tests use the fact that previous unit tests made posts in order for the integration tests to work, or that some integration tests depend on previous integration tests.\
\
You will need to have mongoDB to be able to run this web app in it's intended manner, you can run the commands `brew tap mongodb/brew` and then `brew install mongodb-community@5.0` in order to install mongoDB.\
\
In order to access for the website to function, you will need to run the server on localhost by using `npm start` and then going on `localhost:2800` to access the website. From there, you will be able to make an account and those account details will then be stored on your local database.\
\
You will be able to post pictures so make sure to clear the database every so often so that it does not take up too much space - to do this, open `mongo` in the terminal, use the command `use instagram` (or `use instagram_test` if you wish to access the test database, although that gets cleared every time tests are ran) to access the instagram database, then you can use `db.users.drop()` and `db.posts.drop()` to clear the database. Note: currently storing images inside the database is not working (currently storing urls of images) but you can still clear the database if you wish.

## User Stories
```
As a User,
So that nobody else can use my account,
I would like to be able to log out

As a User,
So that I can share pictures to other people,
I would like to be able to post pictures

As a User,
So that I can interact with people I like,
I would like to be able to comment on pictures

As a User,
So that I can give other people my approval,
I would like to be able to like their pictures

Bonus:
As a User,
So that I can make my pictures look even better,
I would like to be able to add filters to them
```

## References
```
https://www.asciiart.eu/electronics/cameras
https://geeksforgeeks.org/upload-and-retrieve-image-on-mongodb-using-mongoose/
```
used the above for the ASCII art, made by Joan Starks\
used the above to upload and retrieve images in mongoDB - abandoned for now

## Functionality yet to be added
- add CSS
- add comment function
- make it so each user can only like a post once
- add filter function
- add the ability to upload images onto the database rather than using a external image host
