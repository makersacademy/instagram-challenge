Instagram Challenge
===================
## Kittygram


## Features
- [x] Sign in / Sign up
- [x] Posting photos
- [x] Editing/deleting photos
- [x] Liking photos
- [x] Posting/deleting comments
- [] Filters for images
- [] Not finished

## Technologies & Principles

* Ruby
* Rails
* REST
* Devise Token Authentication
* JQuery
* JSON
* Paperclip
* AWS S3
* Heroku
* HAML

## How to run
Either connect to:
https://kittygram-lucalabs.herokuapp.com
1. Clone this repository
2. Run `bundle install`
3. Run `rake db:create` and `rake db:migrate`
4. Run `rails server`
5. Visit `http://localhost:3000`

## User stories
```
As a kitty enthusiast,
So I can use Kittygram,
I would like to Sign up to the website.

As a kitty enthusiast,
So I can share my photos of cute kitties with other users,
I would like to be able to post a photo.

As a kitty enthusiast,
So I can have more control over my photos,
I would like to be able to edit description and/or delete photos.

As a kitty enthusiast,
So I can appreciate other people's photos,
I would like to be able to 'Like' them.

As a kitty enthusiast,
So I can better appreciate other kitty photos,
I would like to be able to post comments.
```
## Further Development
* Allow users to tag photos
* Allow users to sort photos by tags
* Build User Profiles - only showing that users images
* Connect Users - configure following other users
* Logged in feed - only photogaphs from followed users
