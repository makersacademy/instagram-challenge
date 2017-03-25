Instagram Challenge
===================

### Makers Academy Week 8 Weekend Challenge - Ruby on Rails

This app is a clone of Instagram, named 'Instaflash'.

[Click here to see the demo on Heroku.](http://rkclark-instaflash.herokuapp.com/)

## Installation and Usage

- Clone this repo
- Run `bundle install` in project root directory
- Run `bin/rake db:create` to create databases
- Run `bin/rake db:migrate` to run database migrations
- Run `bin/rails s` to run the rails server
- Open `http://localhost:3000` to view the app

### Running the Tests

Run `rspec` in the project root directory

### Screenshots

Homescreen

![insta_1](http://i.imgur.com/hkyhkiW.png)

Mobile view

![insta_3](http://i.imgur.com/WhHLkIY.png)

Add new image

![insta_2](http://i.imgur.com/GluGxq4.png)

Newly added image with no likes or comments

![insta_4](http://i.imgur.com/CVW8ren.png)

And then with a like and commment

![insta_5](http://i.imgur.com/nk0zW2Z.png)



## User Stories

The application fulfils the following user stories:

```
As a visitor,
I want to be able to sign up for Instaflash,
So I can use the services of the site
```

```
As a visitor or a user,
I want to be able to see all images recently uploaded to Instaflash,
So I can look for images that interest me
```

```
As a user,
I want to be able to upload an image to Instaflash,
So that I can share it with others
```

```
As a user,
I want to be able to give my image a name and description,
So I can provide information about it to others
```

```
As a user,
I want to be able to comment on an image,
So I can communicate with other users
```

```
As a user,
I want to be able to like an image,
So I can convey my enjoyment to the user who posted it
```

## Project Management

I created a project to [manage my work in Taiga](https://tree.taiga.io/project/rkclark-instaflash/).

I created two sprints; an initial MVP to fulfil the user stories and then a further sprint to implement 'nice to haves' and styling.

## Technologies Used

**Framework**

- Ruby on Rails 5.0.1
- Devise for User model
- Haml for view template engine
- Paperclip for image handling

**Database**

- Postgresql

**Testing**
- RSpec
- Capybara
- Poltergeist
- Database Cleaner

**External Services**
- Amazon Web Services S3 for image hosting
