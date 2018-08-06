# Instasham

_Fed up with filters? Infuriated by influencers? Beaten by the bots?_ <b>

_Join **Instasham**, the photo-sharing site which will take you back to a simpler time._

___

## Summary

Week 8 Makers Academy weekend project to develop an Instagram clone, which I'm calling Instasham.</br>

___

## Credits

Developed solo by Elishka Flint.
___

## Learning Outcomes

### Topics Covered

* Ruby on Rails - routes, database migrations, using the Rails generator
* Incorporating gems for functionality (Devise for users, CarrierWave and MiniMagick for image uploads)
___

## Implement User Stories

```
As a user,
So that I post on Instasham,
I would like to sign up for an account.
```
```
As a user,
So that I access my account on Instasham,
I would like to be able to log in and out.
```
```
As a user,
So that I can share my pictures,
I would like to be able to post a photo and comment to Instsham.
```
```
As a user,
So that I can curate my content,
I would like to be able to update and delete my posts.
```
___

## What I would do next

* Fix routing - log in, sign up and post all redirect back to a basic landing page and posts are a further click away
* Implement full test suite - my goal for this project was to explore in-built Rails features and gems in a finite amount of time (5 hours), therefore I took a decision not to TDD as I would with any other project
* Create profiles and bios for each user
* Add like and comment functionality
* Create relationships between users so that users can have followers

___

## Technical

### Tech/Frameworks Used

Ruby on Rails

### Launching the Application

```
$ git clone https://github.com/elishkaflint/instasham.git
$ cd instasham
$ bundle
$ rake db:migrate
$ rails s
> Visit localhost
```
____
