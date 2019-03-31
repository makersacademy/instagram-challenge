[![Build Status](https://travis-ci.org/dafuloth/instagram-challenge.svg?branch=master)](https://travis-ci.org/dafuloth/instagram-challenge) 
[![Coverage Status](https://coveralls.io/repos/github/dafuloth/instagram-challenge/badge.svg?branch=master)](https://coveralls.io/github/dafuloth/instagram-challenge?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/7dddaa400f33d854d758/maintainability)](https://codeclimate.com/github/dafuloth/instagram-challenge/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/7dddaa400f33d854d758/test_coverage)](https://codeclimate.com/github/dafuloth/instagram-challenge/test_coverage)

# Instagram clone using Rails

_Week 8 Weekend Challenge: [challenge README.md](./challenge_README.md)_

## Ruby version

This Rails project was developed with Ruby 2.6.0.

## System dependencies

* PostgreSQL database system

## Getting started

```bash
bundle install
rails db:create
rails db:migrate

```

## Running the tests

This project uses Travis CI/CD which also runs the tests, so rspec output is available in the [Travis repository](https://travis-ci.org/dafuloth/instagram-challenge) job log.

To run locally:

```bash
rake spec

```

The `simplecov` gem is used to measure test coverage and is invoked with each test run. Output is available in the `coverage` directory, in the `./coverage/index.html` file.

This remote repo has `coverage` in `.gitignore` as coverage is being tracked by [Coveralls](https://coveralls.io/github/dafuloth/instagram-challenge).

![Tracking coverage with Coveralls](./coverage.png)

## References


---

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Resources

* https://devhints.io/devise
* https://devhints.io/rails
