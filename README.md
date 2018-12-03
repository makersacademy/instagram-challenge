Instagram Challenge
===================

[![Build Status](https://travis-ci.com/afaraone/final-project.svg?branch=master)](https://github.com/djstephenson7/instagram-challenge)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/afaraone/final-project)
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/djstephenson7)
[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://github.com/djstephenson7)

# Mintstagram

A clone of Instagram, with all of its features. Users can signup, login and post photos.

## Getting Started

To get started, fork this repository. Open your terminal and navigate to the directory you wish to store this program in. In the Github repository, click on 'Clone or download' and copy the SSH key. In your terminal, type in 'git clone', paste the SSH key and press 'Enter'. You will now have a copy of our program on your machine.

### Prerequisites

Before you can start the program, you first need to install its dependencies. Assuming you are in the root directory, run these commands in your terminal:

```
cd instagram-challenge
gem install bundler
bundle install
```
Then return to the root directory with 'cd ..' and run this command:

```
npm install
```
### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc


## Instructions

* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!

# README

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


## User stories

# Everything above the line has been completed, while everything below is still to do

````
As a user,
So I can have an account on an amazing website,
I can sign up with my username, email and password.

As a user,
So I can access said website with my details,
I'd like to be able to login with my username and password.

As a user,
So I can dazzle people with my thoughtful pictures,
I can post images to my Mintstagram feed.

As a user,
So I don't accidentally post something compromising,
I'd like to be able to delete my posts.

As a user,
So I can see when posts were created,
I'd like to see the date and time they were posted.

As a user,
So I can stay updated to the latest information,
I'd like to see my posts in reverse chronological order.
_______________________________________________________________

As a user,
So I can tell my friends what I think of their pictures,
I'd like the ability to leave comments on pictures.

As a user,
So I can see what others think of my post,
I'd like to see other people's comments on my post.

As a user,
So I can show my approval.
I'd like to be able to 'like' other people's posts.

As a user,
So I can see how popular my posts are,
I'd like to be able to see the amount of likes on a post.

As a user,
So I don't accidentally give someone too much approval,
I'd like to be able to only like a post once.
