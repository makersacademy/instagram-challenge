# Instagram Challenge

Challenge time: one weekend

The challenge was to build Instagram using Rails. An app should have users who can post pictures, write comments on pictures and like a picture.


## Using this application

- Download the source code using ``$ git clone``
- Navigate into the root of the directory using ``$ cd instagram-challenge``
- Install all the dependencies by running the command ``$ bundle`` in the root directory

- Download PostgreSQL (if you do not already have it installed)
- Within the command line, run `$ bin/rake db:create` and then `$ bin/rake db:migrate`
- Run the app using the command `$ bin/rails server`
- Go to localhost:3000 in rout browser to view and interact with the app

## Running the tests

Within the root of the directory, run `$ rspec` to see the results of the tests in the command line

## Dependencies

- Application written in Ruby 2.3.3 and built using Ruby on Rails
- Based on a PostgreSQL database with ActiveRecord as the ORM
- Tested using RSpec and Capybara
- Uses Paperclip gem for uploading pictures
- Uses Devise for User Sign up and Log in


## Approach

- In the very beginning I decided to have **picture** model to represent each post, with description and image as its properties.
Each picture has **comments** and **likes**, represented by their own models. Each picture also belongs to a **user**, created with the help of devise gem.  

- I have built a schema based on this domain model and rails' embedded configurations helped me doing that.

- used Bootstrap to style my website


## User Stories

```
  As a user
  So that I post pictures
  I need to register and log in to the website
```
```
  As a user
  So that I can post pictures
  I want to be able to upload a picture
```

```
  As a user
  So that I can interact with other users
  I want to be able to leave comments on their pictures
```

```
  As a user
  So that I can interact with other users
  I want to be able to leave 'likes' on their pictures
```
