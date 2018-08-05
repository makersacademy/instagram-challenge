# Snappergram

Snappergram is a rebuild of Instagram using Ruby on Rails (5.1.6). User sign-up and validation is handled by the Devise gem. Image upload is handled by Paperclip. The app uses an Sqlite database.

![screenshot](https://github.com/n-ckr-ch-rds-n/snappergram/blob/master/snappergram/app/assets/images/Screen%20Shot.png)

## Getting Started

To run the app on your machine, clone this repository, run `bundle install` to install the gems, run `rails db:create`, `rails db:migrate`, fire up the `rails server` and navigate to localhost:3000 in your browser.

To run the tests, first ```bundle install``` then run ```rspec``` from the command line to run the tests.

## User Stories

```
As a lover of images
So I can share my pics with my pals online
I want to be able to upload and view an image on Snappergram
```
```
As a lover of images
So I can save face when I make a cringey post while drunk
I want to be able to edit my posts
```
```
As a lover of images
So I can share my images with the world
I want to sign up for a Snappergram account
```
```
As a lover of images
So that others can't post images using my account
I want to be able to log out
```
```
As a lover of images
So that I can access my Snappergram account
I want to log in
```
```
As a lover of images
So that I can share my wisdom with other image lovers
I can comment on posts
```
