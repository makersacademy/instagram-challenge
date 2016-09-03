Instagram Challenge
===================
[![Build Status](https://travis-ci.org/richo225/richagram.svg?branch=master)](https://travis-ci.org/richo225/richagram)
[![Coverage Status](https://coveralls.io/repos/github/richo225/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/richo225/chitter-challenge?branch=master)

An instagram clone developed using the Ruby on Rails framework.

https://richagram.herokuapp.com/

Installation
------------
Clone the repository:
```
$ git clone git@github.com:richo225/richagram.git
$ cd richagram
```
Get the required gems:
```
$ bundle install
```
Create the database:
```
$ rake db:create
$ rake db:migrate
```

Running the app
---------------
Run the rails server:
```
$ bin/rails s
```
Open another terminal window
```
$ open http://localhost:3000 //OS X
$ xdg-open http://localhost:3000 //Linux
```

Demonstration
-------------
![1](https://cloud.githubusercontent.com/assets/18379191/18226133/21f00ad4-71fb-11e6-9386-1e4f9c9f76f8.png)

![2_2](https://cloud.githubusercontent.com/assets/18379191/18226132/21edf6fe-71fb-11e6-826d-344112ef7238.png)

![3](https://cloud.githubusercontent.com/assets/18379191/18226134/22005f7e-71fb-11e6-8cfa-b4f4c108e40d.png)

![4](https://cloud.githubusercontent.com/assets/18379191/18226135/2204b0b0-71fb-11e6-91d9-5dda6a0de2c9.png)

![5](https://cloud.githubusercontent.com/assets/18379191/18226136/220aea16-71fb-11e6-935c-4ada89cf0716.png)

Uploading images
----------------

![6](https://cloud.githubusercontent.com/assets/18379191/18226137/220b4dbc-71fb-11e6-964e-5c4b397fdb4b.png)

![7](https://cloud.githubusercontent.com/assets/18379191/18226139/220fdbb6-71fb-11e6-9689-63b058bd911c.png)

![8](https://cloud.githubusercontent.com/assets/18379191/18226138/220c6dfa-71fb-11e6-8975-c82d4cbdb149.png)

![9](https://cloud.githubusercontent.com/assets/18379191/18226140/22137078-71fb-11e6-846f-395cc7ec32b0.png)

User stories
------------
```
As a photographer
So that I can show everyone my awesome life
I want to be able to post pictures

As a photographer
So that I can show where my pictures were taken
I want to be able to add a description to a picture

As a photographer
So that I only show my favourite pictures
I want to be able to delete a picture
```
```
As a user
So that I can be jealous of my friends
I want to be able to view pictures

As a user
So that I can give my opinion
I want to be able to comment on pictures

As a user
So that I can show my love for pictures
I want to be able to like a picture

```

Bonus user stories
------------------
```
As a photographer
So that others can find my pictures
I would like to be able to add tags

As a photographer
So that I can make my pictures look better
I would like to be able to add filters to a pictures

As a user
So that I can easily find interests of mine
I would like to be able to search for pictures by tags
```

Technologies
------------
* Rails-5
* Ruby
* Postgresql
* Rspec
* Capybara
* Paperclip
* Amazon Web Services S3
* Bootstrap-4
* Heroku

Future implementations
----------------------
