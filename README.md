[![Build Status](https://travis-ci.org/m-rcd/instagram-challenge.svg?branch=master)](https://travis-ci.org/m-rcd/instagram-challenge)
[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/codeclimate/codeclimate/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/ba4c5799e9647f50ce5f/test_coverage)](https://codeclimate.com/github/m-rcd/instagram-challenge/test_coverage)
#  Spaceagram


## Features

- [x] User can sign up with email and username
- [x] User can sign in
- [x] User can sign out
- [x] User can add picture
- [X] User can see the username above the picture
- [x] User can update pictures
- [x] User cannot update someone else's post
- [x] User can delete posts
- [x] User cannot delete someone else's post
- [x] Pictures show date they were posted
- [x] Pictures appear with newest first
- [x] User can comment on pictures
- [x] Comments show date they were posted
- [x] User can like pictures
- [x] User cannot like more than once
- [x] User can have a profile with all their pictures
- [x] User can follow another user
- [x] User can unfollow another user

To be done later:
- [ ] User can add profile picture
- [ ] User can send private messages to other users
- [ ] User have to confirm their email address when signing up

## Technologies

- rails
- Postgres
- carrierwave
- miniMagik
- Devise
- Rspec
- html

### Instructions

- Clone this [repo](https://github.com/m-rcd/instagram-challenge)
- Go to project directory
```
cd instagram-challenge
```
- Install gems
 ```
  Bundle install
  ```
- Create database
 ```
  rake db:create
  rake db:migrate
  ```

- Start server
```
bin/rails server
```
- Visit `localhost:3000`
- Run `rspec` for the test


[Sign up!](https://spaceagram.herokuapp.com/)
