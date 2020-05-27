Instagram Challenge
===================

[Getting Started](#getting-started) | [Dependencies](#dependencies) | [Running Tests](#running-tests) | [Deployment](#deployment) | [Criteria for Building the Project](#criteria-for-building-the-project)

**Travis build status:**

![Travis Build](https://travis-ci.com/lilawalker/instagram-challenge-lw.svg?branch=master)

This repo is an Instagram clone app developed as part of a project whilst attending Makers Academy.

The requirements of the task:

"Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome)."

## Getting Started

Ensure you have the following setup on your machine:
- Bundler
- ImageMagick
- PostgreSQL

`git clone` this repository and `cd` into the directory.

Install dependencies:

```
$ bundle install
```

Create, migrate and seed the database:

```
$ rails db:setup
```

Setup image storage:

- Set up an [AWS S3 account](https://aws.amazon.com/s3/)
- Create a bucket in S3
- Get your S3 access key id and secret access key
- Create a `.env` file in your root directory containing the following:

```
S3_KEY=<your-access-key-id>
S3_SECRET=<your-secret-access-key>
S3_BUCKET=<your-bucket-name>
```

To run the project, start up the server:

```
$ foreman start
```

Then navigate to `localhost:5000` in your browser


## Dependencies

This project relies on the following Rails Gems:

- Devise (for user authentication)
- CarrierWave (for image uploading)
- MiniMagick (for image manipulation)
- Fog-AWS (for image storage)


## Running Tests

Travis CI is setup to run tests and linting upon each GitHub commit.

This project is setup with:
- RSpec
- SimpleCov
- Rubocop
- Travis CI

To run the tests:
```
$ bundle exec rspec
$ bundle exec rubocop
```

All tests are passing with 95% test coverage.

## Deployment

The app is deployed via Heroku. [Link to App](https://instagram-challenge-lw.herokuapp.com/)

If all tests pass, commits on the master branch are automatically deployed to Heroku via Travis

## Criteria for Building the Project

#### Domain Model

| Models | Methods | State |
| :--- |:--- | :--- |
| Users | sign_up, sign_in, sign_out  | name, email, password |
| Pictures | create, delete | image, user_id |
| Comments | create, delete, edit | text, user_id, picture_id |
| Likes | create, delete | user_id, picture_id |

#### User Stories

```
As a user
So that I can join in on the fun of Instragram
I need to create an account on Instagram

As a user
So that I can view photos on Instagram
I need to login to my account

As a user
So that I can be sure my account is secure
I need to be able to logout of my account

As a user
So that I know that I am logged in and ready to use the app
I would like to see a welcome message with my name

As a user
So that I can share my favourite pictures
I would like to be able to upload images to Instagram

As a user
So that I know who shared the picture
I would like to see the name of the person who uploaded the image

As a user
So that I know when the pictures were shared
I would like to see the date the image was posted

As a user
So that I can see the most recent pictures
I would like to see the images in reverse chronological order

As a user
So that I can remove pictures I've shared
I would like to delete an image I posted

As a user
So that I can only remove my own pictures
I would like the delete option not to appear on other users' images

As a user
So that I can tell others what I think of their pictures
I would like to be able to comment on images

As a user
So that I know who shared the comment
I would like to see the name of the person who posted the comment

As a user
So that I know when the comments were shared
I would like to see the date the comment was posted

As a user
So that I can remove a comment
I would like to be able to delete a comment on a image

As a user
So that I can only remove my own comments
I would like the delete option not to appear on other users' comments

As a user
So that I can update a comment
I would like to be able to edit a comment

As a user
So that I can tell others that I like their pictures
I would like to be able to 'like' an image

As a user
So that I can can change my mind about liking a picture
I would like to be able to 'unlike' an image
```

#### Acceptence Criteria

The above user stories were implemented with the following criteria in mind:

Sign up:
- [x]  the user must be logged in to use the site
- [x]  if not logged in and they visit another URL they are redirected to the sign_up page
- [x]  the user can see a sign up page which prompts them to enter in their email address and password
- [x]  the user can only enter valid emails, otherwise they see helpful information to indicate why the email was not valid
- [x]  the user can only enter passwords between 6-10 characters, otherwise they see helpful information to indicate why the password was not valid
- [x]  when the user submits their details, they are logged in and redirected to their pictures page with a message saying they were successful signing up

Sign in:
- [x]  the user can see a link to a sign in page which prompts them to enter in their email address and password
- [x]  the user can only enter in valid email and password
- [x]  when the user submits their details, they are logged in and redirected to the pictures page
- [x]  the user is able to logout

Images:
- [x]  the user can upload an image from their local machine
- [x]  the user can only upload images in the correct file format
- [x]  after upload, the user is redirected to the main pictures page and sees all uploaded images
- [x]  the image is resized upon upload
- [x]  the image is a clickable link to the image path which includes a link to delete the image
- [x]  the user can only delete their own images and do not see the delete option on images they do not own
- [x]  the user can see the name of the user who posted the image above the picture
- [x]  the user can see the time ago in words that the images were posted, and images are in reverse chronological order
- [x]  images are hosted on AWS
- [x]  on each picture, the number of comments and likes are listed, as well as a link to add a like or comment

Comments:
- [x] user can comment on any image
- [x] comments display the name of the user and the time ago in words when posted
- [x] comments can be edited and deleted
- [x] user cannot delete or eidt another user's comments and does not see the options on other user's comments
- [x] the user can view all the comments on the individual picture page

Likes:
- [x] user can like and image
- [x] after liking and image, the user only sees an option to unlike the image
