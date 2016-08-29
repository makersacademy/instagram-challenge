Instagram Challenge
===================

## Live demo
https://arugram.herokuapp.com

## Intro
* Challenge time limit
  * 2 days (weekend)
* Challenge requirements
  * Ruby on Rails
* Development practices used
  * TDD
  * Agile

## Features
* :heavy_check_mark: Sign in / Sign up
* :heavy_check_mark: Posting photos
* :heavy_check_mark: Editing/deleting photos
* :heavy_check_mark: Liking photos
* :heavy_check_mark: Posting/deleting comments
* :heavy_check_mark: Viewing individual users
* :heavy_check_mark: Following/unfollowing users
* :heavy_check_mark: User feed includes photos from followed users
* :heavy_check_mark: Viewing the list of active users

## How to run
1. Clone this repository
2. Run `bundle install`
3. Run `rake db:create` and `rake db:migrate`
4. Run `rails server`
5. Visit `http://localhost:3000`

## User stories
```
As a user,
So I can use SquareGram services,
I would like to Sign up to the website in multiple ways.

As a user,
So I can share my photos with other users,
I would like to be able to post a photo to my feed.

As a user,
So I can have more control over my photos,
I would like to be able to edit description and/or delete photos.

As a user,
So I can appreciate other people's photos,
I would like to be able to 'Like' them.

As a user,
So I can better appreciate other people's photos,
I would like to be able to post comments.

As a user,
So I can be updated with photos from my favourite users,
I would like to be able to follow users and see their posts on my feed.
```

### Additional notes on my thought process of models and relations
* `Feed` model as a resource to hold particular user's feeds.
  * `#show` shows an individual user's feed (his/her photos only)
  * `#index` shows your personal feed joined by the feeds of every user you follow.
* As usual, `Photo` model deals with individual photos, and they belong to a user and a particular feed.
* `Users` have many photos and one (1) feed. Feeds cannot be edited or deleted by hand. Only shown.
* `Comments` can be posted by registered users and they belong to `User` and a `Comment`. Can be deleted.
* `Likes` belong to a `Photo` and they're unique within the scope of a `User`
* `Users` have many followers and many followed users.
