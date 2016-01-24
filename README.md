![makersacademy](https://github.com/allimac/resources/blob/master/ma_logo.png)

**week 7 / weekend challenge**

# The challenge

This weekend the brief is simple enough: build a clone of the Instagram web-app.

# Implementation

The implementation was driven by acceptance unit test cycles, using Rspec/Capybara and Poltergeist as testing frameworks. The app is far from being finished! This project represents more what was achievable in a weekend of Ruby on Rails.


## User stories implemented
- So that I can start uploading/like pictures, I can create a new account
- So that I can upload my pictures, I can log in into Instagram
- So that I can keep my Instagram identity safe, I can log out
- So that I can show off my photographic skills, I can upload a picture
- So that I can show other users my love, I can like pictures
- So that I can always find something interesting, I can see the latest added pictures
- So that I can perceive the space as alive, I can see how long ago the pictures were posted
- So that I can know who the author was, I can see the name of the picture's author


## How to use it
Two ways to check this project out: either at https://instagram-clone-camilla.herokuapp.com or following the instructions below to run it on your machine:
```
$ git clone git@github.com:allimac/ma-instagram-challenge.git
$ bundle install
$ rake db:create
$ rake db:migrate
```
- Start the server
```
$ rails s
```
- Visit localhost:3000 in your browser to see the app
- To check out the tests run:
```
$ rspec
```

## Future improvements
- Many user stories that I was planning to have developed by the weekend
## Credits
