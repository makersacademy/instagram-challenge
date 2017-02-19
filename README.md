### Instagram Challenge

This project is a simple clone of Instagram using Rails. I built it over 2 days.

Screenshots
===========

Signing up.

![alt tag](./Screen Shot 2017-02-14 at 20.13.26.png)

Signing in.

![alt tag](./Screen Shot 2017-02-14 at 20.18.04.png)

Viewing pictures.

![alt tag](./Screen Shot 2017-02-14 at 20.15.19.png)

Approach and Technologies used
==============================

* Ruby on Rails
* Feature testing using capybara, unit testing using RSpec.
* Postgres SQL for database.


Instructions and Installation
=============================

1. Fork and clone this repo

2. Run ```bundle``` to add all the necessary gemfiles to your system.

3. You will need to build the database on your local system. ```bin/rails db:create```

4. Then run ```bin/rails db:migrate```

5. Enter ```rspec``` to run all the feature and unit tests.

User Stories
============
```
As a user
So people can see my photos
I want to be able to upload my photos

As a user
So I can add some context to my photos
I want to be able to add a description to my photos

As a user
So I can follow my friends on social media
I want to be able to log in with Facebook

As a user
So I can see another user's photos
I want to be able to follow another users

As a user
So I can appreciate another photo
I want to be able to like a photo

As a user
So I can give my feedback about another photo
I want to be able to comment on a photo

```
