Instagram Challenge
===================

### Makers Academy Week 8 Weekend Challenge - Ruby on Rails

The app is deployed to Heroku, [click here to have a look.](http://rkclark-instaflash.herokuapp.com/)

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

## Installation and Usage

*Requires Amazon Web Services S3 account*

- Create a new AWS S3 Bucket
- Clone this repo
- Run `bundle install` in project root directory
- Create a `.env` file in the project root containing the following environment variables:
```
S3_BUCKET_NAME --> Your AWS Bucket name
AWS_ACCESS_KEY_ID --> Your AWS Access Key
AWS_SECRET_ACCESS_KEY --> Your AWS Secret Acesss Key
AWS_REGION --> Your AWS Region, e.g. 'eu-west-2'
AWS_HOST_NAME --> Your AWS Host Name, e.g. s3.eu-west-2.amazonaws.com
```
- Run `bin/rake db:create` to create databases
- Run `bin/rake db:migrate` to run database migrations
- Run `bin/rails s` to run the rails server
- Open `http://localhost:3000` to view the app

### Running the Tests

Run `rspec` in the project root directory
