Week 8 - Instagram Clone Challenge!
==================

 ![Alt text](https://media.giphy.com/media/pJjKzRqY9HwME/200w_d.gif)

This project is our 8th weekend challenge and our first week of Rails framework. Completed solo on 8th-9th July 2018. We were tasked with creating a clone of instagram!<br>

For context, at time of completion I had 1 week experience with Rails.<br>

Heroku link: https://faldoinstagram.herokuapp.com/

## Instructions:  

```
Your challenge is to build Instagram using Rails.
You'll need **users** who can post **pictures**,
write **comments** on pictures and **like** a picture.
Style it like Instagram's website (or more awesome).
```

## MVP:

__I came up with the following user stories and mock up for my MVP:__

<img src="/mvp_user_flow_sreenshot.40.30.png" />

__And included the following user stories as part of the MVP:__
```
As a user,
So that I can see what people are up to,
I can see peoples most recent posts
```
```
As a user,
So that I can use instagram,
I can sign up
```
```
As a user,
So that I can access my account,
I can log in
```
```
As a user,
So that I can share what's going on in my life,
I can make a text post
```

__See also non-MVP user stories:__

```
As a user,
So that I can give people more visual details,
I can add a photo to my post
```

```
As a user,
So that I can see who posted what,
I can see the posters name next to their post
```
```
As a user,
So that I can express my approval,
I can like a post
```
```
As a user,
So that I can let people know what I think of their posts,
I can write comments on posts (medium)
```

## Getting started

* Fork this repo and clone to your local machine

```
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> rake # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Usage

It is deployed and you can use it at Heroku link: https://faldoinstagram.herokuapp.com/

![Alt text](https://media.giphy.com/media/1poTBX0Fhf41FMvOtU/giphy.gif)


## Tech/Framework used

* __Ruby__ (2.4.1)
* __Rails__ framework (5.2.0)
* __Travis__ (CI/CD)
* __Heroku__ (deployed automatically with Travis on merge with master)
* __CarrierWave__ gem for uploading images
* __Devise__ gem for login, registration and authentication
* __Postgresql__
* __Rspec-rails__ (3.5) / Capybara (2.5.0) for testing
* __Bootstrap / CSS__

* __Trello__ (for kanban style workflow)
* __Balsamiq__ (for wireframing mockups)

## Running tests

Run
``` rake ```
from the root directory

## Credits

### A big thanks to the following people for their content and help!:

__For using Devise gem for login & authentication__
1. Documentation for devise: https://github.com/plataformatec/devise#strong-parameters
2. Adding custom fields to devise registration: http://www.peoplecancode.com/tutorials/adding-custom-fields-to-devise
3. Followed this guide for getting devise up and running: https://www.youtube.com/watch?v=rrC37eeMNIY
4. To stub authentication of devise in controller specs:
https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
5. Devise could not find the `Warden::Proxy` instance on your request environment error:
https://stackoverflow.com/questions/41910712/helper-devise-could-not-find-the-wardenproxy-instance-on-request-environmen

__For uploading images:__
1. CarrierWave gem: https://github.com/carrierwaveuploader/carrierwave
2. I found this video useful, it does image upload without CarrierWave (to show you what carrierwave
  automates) and then with it: https://www.youtube.com/watch?v=Q8wF9RrJhrY&t=1171s
3. I found this guide useful: https://www.learnenough.com/course/ruby_on_rails_tutorial_4th_edition/user_microposts/micropost_images/basic_image_upload

__Travis / CI / CD / Heroku__
1. Getting started with Travis & initial steps: https://docs.travis-ci.com/user/getting-started/<br>
The page you were looking for does not exist (but does work locally) error....<br>
2. Could be that I need to empty the database https://gist.github.com/zulhfreelancer/ea140d8ef9292fa9165e
3. Travis needs to make heroku needs to run db:migrate after deploying app: https://stackoverflow.com/questions/24566869/rails-app-works-locally-but-not-when-deployed-to-heroku

__Bootstrap__
1. Adding bootstrap 4 to rails: https://github.com/twbs/bootstrap-rubygem
2. Cards: https://getbootstrap.com/docs/4.0/components/card/
3. Navbar: https://www.w3schools.com/Bootstrap/bootstrap_navbar.asp
