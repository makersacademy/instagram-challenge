# Christagram
![Build Status](https://travis-ci.org/chrisjgilbert/instagram-challenge.svg?branch=master)

[![Coverage Status](https://coveralls.io/repos/github/chrisjgilbert/instagram-challenge/badge.svg?branch=master)](https://coveralls.io/github/chrisjgilbert/instagram-challenge?branch=master)

[An Instagram clone made with Rails deployed on Heroku](https://quiet-spire-51096.herokuapp.com/)

## How to use

```bash
> git clone https://github.com/chrisjgilbert/instagram-challenge
> cd instagram-challenge
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # to run the tests
> rails s # Start the server at localhost:3000
```

To clean local database use

```
> bin/rails db:drop
> bin/rails db:create
> bin/rails db:migrate
```
