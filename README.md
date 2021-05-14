# Instagram (Ruby on Rails)

## How to run
Requires PG running on your machine -
```
$ git clone git@github.com:sandyMax974/instagram-challenge.git
$ cd instagram-challenge
$ bundle install
$ rake db:create
$ rake db:migrate
$ rackup
```


## User Stories
```
As a user
I want to be able to register, sign in and sign out of instagram

As a system manager
I want only registered users to be able to post

As a user
I want to see all instagram posts on my feed

As a user
I want to be able to post (img, username)

As a user 
I want to be able to comment other user's posts

As a user 
I want to be able to like other user's posts

As a user
I want to be able to visit other users profile page containing their posts
```

## Tech Stack

* Rails '6.1.3.1'
* PostgreSQL
* ruby '2.6.5'
* RSpec
* Devise


