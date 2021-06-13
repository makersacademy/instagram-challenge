# Rosstagram

[![CodeFactor](https://www.codefactor.io/repository/github/jasonrowsell/instagram-challenge/badge)](https://www.codefactor.io/repository/github/jasonrowsell/instagram-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/a156462f2fa7d2a3fff7/maintainability)](https://codeclimate.com/github/jasonrowsell/instagram-challenge/maintainability) [![Build Status](https://travis-ci.com/jasonrowsell/instagram-challenge.svg?branch=master)](https://travis-ci.com/jasonrowsell/instagram-challenge) [![Coverage Status](https://coveralls.io/repos/github/jasonrowsell/instagram-challenge/badge.svg?branch=master)](https://coveralls.io/github/jasonrowsell/instagram-challenge?branch=master) [![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

**[Check it out here.](https://evening-eyrie-51491.herokuapp.com/)**

<!-- Table of Contents -->

## Table of Contents

- [Overview](#overview)
- [Live Demo](#live-demo)
  - [Screenshots](#screenshots)
- [Getting Started](#getting-started)
  - [Development](#development)
- [Spec](#spec)
  - [Brief](#brief)  
- [Features](#features)
- [Design](#design)
  - [Testing](#testing)
  - [Test Coverage](#test-coverage)
  - [Technologies Used](#technologies-used)
- [Plan](#plan)
  - [User Stories](#user-stories)
  - [MVC](#mvc)
  - [Request Response Cycle](#request-response-cycle)

<!-- Overview -->

**Rosstagram:** A full-stack web app inspired by the functionality of [Instagram.](https://www.instagram.com/) The web app allows the user to create an account, sign-in, and post a picture, amongst other functionalities. The web app was built with Rails, and focuses on using an Agile methodology, demonstrating TDD, and applying OOP/D.

The features built in this project are based on a [brief.](brief.md)

<!-- Live Demo -->

## Live Demo

**[Check it out here.](https://evening-eyrie-51491.herokuapp.com/)** This app is in production, features will be implemented as the project progresses.

### Screenshots

![Home](./public/images/home.png)
![Feed](./public/images/feed.gif)

## Getting started

### Development

To get started with the app, first clone the repo and `cd` into the directory:

```
$ git clone https://github.com/jasonrowsell/instagram-challenge.git 
$ cd instagram-challenge
```

Then install the needed gems (while skipping any gems needed only in production):

```
$ bundle install --without production
```

Install JavaScript dependencies:

```
$ yarn install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

[Contents](#table-of-contents)

--------

<!-- Spec -->

## Spec

### Brief

##### Instructions

- Feel free to use Google, your notes, books, etc., but work on your own
- If you refer to the solution of another coach or student, please put a link to that in your README
- If you have a partial solution, **still check in a partial solution**
- You must submit a pull request to this repo with your code by 9am Monday morning

##### Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

##### How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

##### Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

[Contents](#table-of-contents)

--------

<!-- Features -->

## Features

- Create an account
- Sign in with created account
- Post a picture to the feed
- View all pictures on the main feed
- View own pictures on the profile feed
- View pictures of the chosen user's profile
- View other user profiles
- Like a user's picture
- Comment on a user's picture
- Remain logged in (remember token)
- Log out

[Contents](#table-of-contents)

--------

<!-- Design -->

## Design 

### Technologies Used

I used the following technologies to create Rosstagram:

- [Rails](https://rubyonrails.org/)
  - Used as the main framework for the application.
- [PostgreSQL](https://www.postgresql.org/)
  - Used as the main database technology
- [HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5) 
  - Used as the main language for the templates
- [CSS3](https://developer.mozilla.org/en-US/docs/Archive/CSS3) 
  - Used for the overall look of the site and its elements.
- [Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
  - Used to aid site functionality.
- [JQuery](https://jquery.com) 
  - Used to simplify DOM manipulation.
- [Git](https://git-scm.com/)
  - Used for version control. 
- [Heroku](https://www.heroku.com/)
  - Used to host the web app.
- [RSpec](https://rspec.inof/)
  - Used for automated testing.
- [Capybara](https://github.com/teamcapybara/capybara/)
  - Used for functional tests that simulate how users would interact with the application.
- [Selenium WebDriver](https://www.selenium.dev/)
  - Used to automate web-based application testing to verify that it performs expectedly.
- [Font Awesome](https://fontawesome.com/)
  - Used for icons on the web app.
- [Google fonts](https://fonts.google.com/) 
  - Used for website fonts.

[Contents](#table-of-contents)

--------

<!-- Plan -->

## Plan

### User Stories

```
As a newcomer
So that I can use Rosstagram
I would like to create an account
```

```
As a user
So that I can use Rosstagram
I would like to sign in to my account
```

```
As a user
So I can stop my Rosstagram session
I would like to sign out
```

```
As a user
So others can identify me easily
I would like to add a profile picture
```

```
As a user
So I can engage with the community
I would like to make a post to a feed
```

```
As a user
So I keep up to date with the community
I want to view all posts on the feed
```

```
As a user
So I can connect with others on Rosstagram
I want to be able to follow users
```

```
As a user
So I can connect with others on Rosstagram
I want to be able go to a user's pages
```

```
As a user
So I can engage with the community
I want to view a users posts on their page
```

```
As a user
So I can interact with the community
I want to comment on posts made by users
```

```
As a user
So I can interact with the community
I want to react to user's posts with 'likes'
```

```
As a user
So I can filter my engagement with the community
I want to block a user if necessary
```

```
As a user
So I can maximise my engagement with the community
I want to be able to view the website in different languages
```

### MVC

MVC (Model - View - Controller) is an architectural pattern implemented in designing and building software applications. Most commonly, MVC is applied to web applications. The Rails application is split into 3 components:

- Models: Active Record is the _M_ in MVC - the layer responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database.
- Views: Action View is the _V_ in MVC - the layer responsible for handling user interface objects and presentation.
- Controllers: Action Controller is the _C_ in the MVC - the layer responsible for communicating between the Model and View, it receives user input and executes commands accordingly.

### Request Response Cycle

![Request Response Cycle](public/images/rrcycle.png)

- User opens his browser, types in a URL, and presses Enter. When a user presses Enter, the browser makes a request for that URL.
- The request hits the Rails router (config/routes.rb).
- The router maps the URL to the correct controller and action to handle the request.
- The action receives the request, and asks the model to fetch data from the database.
- The model returns a list of data to the controller action.
- The controller action passes the data on to the view.
- The view renders the page as HTML.
- The controller sends the HTML back to the browser. The page loads and the user sees it.

<div align="center">

---

[Top](#table-of-contents)

---

</div>

