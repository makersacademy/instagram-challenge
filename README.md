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
You can then run `npm install` whilst in the main directory in your terminal to install any dependencies.\
\
You can run tests by using the command `npm run start:test` to load up the test server then using `npm test` to run the test files.
\
In order to access for the website to function, you will need to run the server on localhost by using `npm start` then going on `localhost:3000` to access the website. From there, you will be able to make an account and those account details will then be stored on your local database. You will be able to post pictures so make sure to clear the database every so often so that it does not take up too much space - to do this, open `mongo` in the terminal, use the command `use instagram` to access the instagram database, then you can use `db.drop()` to clear the entire database.

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
```
used the above for the ASCII art, made by Joan Starks

## Functionality yet to be added
