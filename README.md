Bowling ScoreCard Challenge!
==================

 ![Alt text](https://media.giphy.com/media/uo6rcjwHSAFsQ/giphy-downsized.gif)

This project is our 8th weekend challenge and our first week of Rails framework. Completed solo on 8th-9th July 2018. We were tasked with creating a clone of instagram!

## Instructions:  
```
Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).
```

## MVP:

I came up with the following user stories and mock up for my MVP:

<img src="./mvp_user_flow_screenshot.40.30.png" />

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
I can make a post
```

## Motivation

Add this???

## Getting started

* Fork this repo
* INSTRUCTIONS

## Usage

TBC

## Tech/Framework used

Built in Ruby (VERSION)
Rails framework (VERSION)

## Running tests

TODO

## Credits

[This little bowling score checker.](http://www.bowlinggenius.com/)<br />


Resources Used:

For using Devise gem for login & authentication
1. Documentation for devise: https://github.com/plataformatec/devise#strong-parameters
2. Adding custom fields to devise registration: http://www.peoplecancode.com/tutorials/adding-custom-fields-to-devise
3. Followed this guide for getting devise up and running: https://www.youtube.com/watch?v=rrC37eeMNIY

For testing
1. To stub authentication in controller spec:
https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs

For uploading image:
1. CarrierWave gem: https://github.com/carrierwaveuploader/carrierwave
2. I found this video useful, it does image upload without CarrierWave (to show you what carrierwave
  automates) and then with it: https://www.youtube.com/watch?v=Q8wF9RrJhrY&t=1171s
3. I found this guide useful: https://www.learnenough.com/course/ruby_on_rails_tutorial_4th_edition/user_microposts/micropost_images/basic_image_upload

Devise could not find the `Warden::Proxy` instance on your request environment error:
https://stackoverflow.com/questions/41910712/helper-devise-could-not-find-the-wardenproxy-instance-on-request-environmen

### bootstrap
1. rubytutorial adding bootstrap sectionr: https://www.railstutorial.org/book/filling_in_the_layout#sec-custom_css
2. Cards: https://getbootstrap.com/docs/4.0/components/card/
3. Navbar: https://www.w3schools.com/Bootstrap/bootstrap_navbar.asp

### Travis / CI / CD / heroku
The page you were looking for does not exist (but does work locally) error:
  * Could be that I need to empty the database https://gist.github.com/zulhfreelancer/ea140d8ef9292fa9165e
  * Travis needs to make heroku needs to run db:migrate after deploying app: https://stackoverflow.com/questions/24566869/rails-app-works-locally-but-not-when-deployed-to-heroku
  * Getting started with Travis & initial steps: https://docs.travis-ci.com/user/getting-started/

## Skills I used creating thing project

* TODO
