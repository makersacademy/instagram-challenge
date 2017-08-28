# Ynstagram

[![Build Status](https://travis-ci.org/i-hardy/instagram-challenge.svg?branch=master)](https://travis-ci.org/i-hardy/instagram-challenge) [![Code Climate](https://codeclimate.com/github/i-hardy/instagram-challenge/badges/gpa.svg)](https://codeclimate.com/github/i-hardy/instagram-challenge) [![Test Coverage](https://codeclimate.com/github/i-hardy/instagram-challenge/badges/coverage.svg)](https://codeclimate.com/github/i-hardy/instagram-challenge/coverage)

## About

An Instagram clone, built using Rails. 

### Features
* Photo uploads, including filter options
* Liking and commenting on photos
* Global photo feed
* Tag pages showing photos that share a tag
* User profiles
* A feed of content from users you follow

## How to use

See the production build on Heroku: [Ynstagram](https://ynstagram.herokuapp.com)

### Local build

**NOTE:** This app is configured to upload to an AWS S3 bucket. You will need to set the following environment variables:

```
S3_BUCKET_NAME=<your-s3-bucket>
AWS_ACCESS_KEY_ID=<your-AWS-access-key>
AWS_SECRET_ACCESS_KEY=<your-AWS-secret-access-key>
AWS_REGION=<your-AWS-region>
```
You will also need [ImageMagick](imagemagick.org) installed for photo management with Paperclip.

To run, do:

```
$ git clone git@github.com:i-hardy/instagram-challenge.git
$ bundle install
$ rails db:migrate
$ rails server
```
then visit http://localhost:3000

## Technologies

* Ruby, Rails
* RSpec, Capybara, FactoryGirl
* Devise, Paperclip
* Bootstrap
