# Rosstagram

[![CodeFactor](https://www.codefactor.io/repository/github/jasonrowsell/instagram-challenge/badge)](https://www.codefactor.io/repository/github/jasonrowsell/instagram-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/a156462f2fa7d2a3fff7/maintainability)](https://codeclimate.com/github/jasonrowsell/instagram-challenge/maintainability) [![Build Status](https://travis-ci.com/jasonrowsell/instagram-challenge.svg?branch=master)](https://travis-ci.com/jasonrowsell/instagram-challenge) [![Coverage Status](https://coveralls.io/repos/github/jasonrowsell/instagram-challenge/badge.svg?branch=master)](https://coveralls.io/github/jasonrowsell/instagram-challenge?branch=master) [![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

[Live Demo](#live-demo) | [Getting Started](#getting-started) | [Features](#features) | [Built Using](#built-using) | [Plan](#plan)

**Rosstagram:** A full-stack web app inspired by the functionality of Instagram. The web app allows the user to create an account, sign-in, and post a picture, amongst other functionalities.

The features built in this project are based on a [brief.](brief.md)

## 👀 Live demo

**[Check it out here.](https://evening-eyrie-51491.herokuapp.com/)** This app is in production, features will be implemented as the project progresses.

![Home](./public/images/home.png)
![Feed](./public/images/feed.gif)

## 🏁 Getting Started

To get started with the app, clone the repo then install the required gems:

```sh
bundle install --without production
```

Next, migrate the database:

```sh
rails db:migrate
```

Run the test suite to verify that everything is working correctly.

```sh
rspec
```

If the test suite passes, run the app in a local server:

```sh
rails server
```

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

## Built Using

- HTML
- CSS/SASS (Bootstrap)
- JavaScript
- jQuery
- Ruby
- Ruby on Rails
- Capybara / RSpec (TDD)
- PostgreSQL

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
