Instagram Challenge
===================

[![Build Status](https://travis-ci.org/darciew/instagram-challenge.svg?branch=master)](https://travis-ci.org/darciew/instagram-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/aff58ba264ca09d128c7/maintainability)](https://codeclimate.com/github/darciew/instagram-challenge/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/aff58ba264ca09d128c7/test_coverage)](https://codeclimate.com/github/darciew/instagram-challenge/test_coverage)

## Technologies
Ruby

Rails

RSpec

Postgres

SQL

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

## User Stories

```
As a photography lover
So that I can share my photos
I can sign up to Instasham
```

```
As a photography lover
So that I can share my photos whenever I want
I can sign in to Instasham
```

```
As a photography lover
So that I can end my session
I can log out of Instasham
```

```
As a photography lover
So that I can share my best photos
I can post a picture to Instasham
```

```
As a photography lover
So that I can appreciate a good photo
I can like a picture on Instasham
```

```
As a photography lover
So that I can write what I appreciate about a good photo
I can comment on a picture on Instasham
```

## Request / Response Cycle Diagram

![Imgur](https://i.imgur.com/FVCXdCS.jpg)

## Instructions

Clone this repo:
```
$ git clone git@github.com:darciew/instagram-challenge.git
$ cd instagram-challenge
```

Install gems:
```
$ bundle install
```

Create and migrate databases:

```
$ rake db:create
$ rake db:migrate
```

Run the rails server:
```
$ bin/rails server
```
Visit http://localhost:3000 to view in your web browser.

## Interface

Sign up:

![Imgur](https://i.imgur.com/AfMcIiC.png)

Upload an image:

![Imgur](https://i.imgur.com/5rfkSr3.png)

Images feed:

![Imgur](https://i.imgur.com/bArvILE.png)

## Trello Board Snippet

Attaching my Trello board to show what I would still like to do for this project. First is to add comments to image posts and deploy to Heroku!

![Imgur](https://i.imgur.com/X28N831.png)
