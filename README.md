Instagram Challenge
===================

## Installation
1. Clone this repository.
2. In the ```kaistagram/``` directory, run:
    - ```bundle install```
    - ```rails db:create```
    - ```rails db:migrate```
3. To start the web server, run ```rails server```
4. By default, this will start the server at ```http://localhost:3000```
5. To execute the test suite, run ```rspec```. The database migration will add test users and data.

## Approach
Back-end: Ruby on Rails, Postgresql
Testing: RSpec, Capybara
Linting; Rubocop
Styling: HTML5, CSS


## User stories
```
As a user,
so that I can use the service
I'd like to sign up with a username, email and password
```

```
As a user,
so that I can post a picture
I'd like to be able to choose and upload an image
```

```
As a user,
so that I can tell the world why I'm awesome
I'd like to include information about the picture I've posted alongside
```

```
As a user,
so that I can quickly inform others that I think they have made a good post,
I'd like to be able to like a picture.
```

```
As a user,
In case I've accidentally liked a picture,
I'd like to be able to cancel my like.
```

```
As a user,
So that I can express more thoroughly my like of a picture,
I'd like to be able to post a text comment to accompany a picture.
```

```
As a user,
So that I can see all the latest pictures,
I'd like them to be posted in a logical order.
```

```
As a user,
So that the service is a pleasure to use,
I'd like to view a quality layout.
```

```
As a poster of an image,
If someone posts a comment I like,
I'd like to be able to click through to their profile to see pictures they have posted.
```




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
