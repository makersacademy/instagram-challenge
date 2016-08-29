# INSTAGRAM CHALLENGE&mdash;
[![Build Status](https://travis-ci.org/benjamin-white/instagram-challenge.svg?branch=master)](https://travis-ci.org/benjamin-white/instagram-challenge)

Instagram inspired weekend challenge from **Makers Academy**. The guidelines for the challenge were _'Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture.'_<br>
For the site's database I used **PostgreSQL** to store user and image information and the **Paperclip Gem** to facilitate image upload. I chose to use **HAML** as the templating language as I liked it's simplicity to write and low cognitive overhead when reading back. Unit and feature tests were written using **Rspec/Capybara** and Facebook login was added through **OmniAuth**. The directory layout and configuration was driven by Rails.<br>
The site was finally deployed to **Heroku** | https://agile-tor-21903.herokuapp.com/

## The User Stories&mdash;

    As a user
    To document my life online
    I would like to be able to upload photos

    As a user
    To gain and give feedback on photos
    I would like there to be comments on photos

    As a user
    To quickly guage the popularity of photos
    There should be a rating system

    As a user
    To make Sign Up and Login easier
    I would like to be able to authenticate my credentials through Facebook

    As a user
    So as to ensure the integrity of my data stored on the site
    I should only be able to edit the images I have posted

#### _Pending :_

    As a user
    To avoid abuse of the rating system
    Signed in visitors should only be able to rate an image once

    As a developer
    To avoid surprises and broken links
    I would like to move asset storage form Heroku to Amazon S3 servers



## Screenshots&mdash;

![Screenshot](https://dl.dropboxusercontent.com/u/81396324/inta_ss_01.jpg)
<br><br><br>
![Screenshot](https://dl.dropboxusercontent.com/u/81396324/inta_ss_02.jpg)

## How to Use&mdash;

To try the site on a local machine clone this repo with `git clone https://github.com/benjamin-white/instagram-challenge.git` and then run bundle in the repositry root `bundle install`. You will need PostgreSQL/psql installed to create the databases with `createdb insta_clone_test` and `createdb insta_clone_development`. Then setup the database schema for the app to use with `bin/rake db:migrate` and lastly `bin/rails s` to start a server and view the site on `localhost:8080`<br>
If there are any issues please send me an email so I can learn why it hasn't worked.

## Future Features&mdash;

* While this isn't ideally a retrospective step I would like to revisit my test coverage as during the weekend image upload code was spiked to get working.
* I suspect Heroku is periodically flushing image storage to meet data quotas. To avoid this I will offload the storage to Amazon's S3 servers.
* I would also like to implement a control on how many times an image can be liked at the database/model level and add additional CSS styling.
