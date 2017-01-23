Instagram Challenge
===================

[Instructions](#instructions) | [AWS](#aws) | [Facebook Login](#facebook-login) | [General information](#general-information) | [Task](#task) | [User Stories](#user-stories) |

[![Build Status](https://travis-ci.org/KPobeeNorris/Instagram-challenge.svg?branch=master)](https://travis-ci.org/KPobeeNorris/Instagram-challenge)

Instructions
-------
* Clone repo: https://github.com/KPobeeNorris/instagram-challenge.git
* Brew install postgresql (if not already installed)
  * Note: you may need to start postgresql by typing: brew services start postgresql
* Brew install imagemagick (if not already installed)
* First install this gem: gem install pg -- --with-pg-config=/usr/local/bin/pg_config
* Bundle install
* To build the database type: bin/rake db:create; you may also need to include: bin/rake db:create RAILS_ENV=test if it errors when trying to run Rspec
* Complete the database migration by typing: bin/rake db:migrate
* You can run the app by typing: bin/rails s and navigating to localhost:3000 in the browser of your choice
* You can see the tests written, and evidence of them all passing, by typing rspec into the command line.  At the time of writing this readme there are 16 passing tests for this application.  

AWS
-----
This application uses AWS services, specifically the s3 bucket for storing the images users upload to the site.  You will need to:
* Create an AWS account
* Navigate to the S3 section and create a bucket
* Create a .env file at the root of the project, and add this to the .gitignore file to keep your data from being made public
* In the .env file you will need to include the following information from your AWS account:
  * S3_BUCKET_NAME=your info here
  * AWS_ACCESS_KEY_ID=your info here
  * AWS_SECRET_ACCESS_KEY=your info here
  * AWS_REGION=your info here


Facebook Login
-----
This app has been set up so that users can login/be authenticated via Facebook.  In order for this to work in your version please complete the following:
* Create a Facebook developer account
* Follow the instructions to create a new app and make sure you specify the website you are using for the project
* Once this is done you will need to add the following information to the .env file:
  * FACEBOOK_APP_ID=your info here
  * FACEBOOK_APP_SECRET=your info here

General information
-----

* App has been deployed to Heroku and the site can be visited at: https://gonna-post-yall.herokuapp.com/
* App has an option to log in via Facebook, but it hasn't been set to public yet so only open to those designated as devs on the Facebook developer site.

![instaclone](https://cloud.githubusercontent.com/assets/20423761/22203600/cb95c914-e165-11e6-9174-49eadc2cc750.png)

Task
-----

Build Instagram - in a weekend, and designed on the user stories below.

This weekend challenge is a solo effort and is a Rails app.  I was able to include and implement the omniauth-facebook gem, which was a success as the previous few days of trying this on another app had caused many problems.  It does work, I have used my own Facebook account to check it, but as yet I haven't made the app live on Facebook so it doesn't work for members of the public yet.  

I also attempted to include CSS and styling for the first time; up until this point in the course I had been focused on creating apps/projects that worked rather than looked good, but didn't do anything.  I am aware that this isn't the flashiest site, but I'm really proud of what I managed in such a short timeframe, and my first use of CSS!  One highlight would be that certain menu items that scroll down the page as you do, saving you having to scroll all the way back up to the top to use them.

User stories
----

```
As a user,
So that I can show off how amazing my life is;
I want to be able to display my beautiful photos for the world to see.

As a user,
So that I can check how popular I am
I want to be able for people to 'like' my posts.

As a user,  
So others can enjoy my posts even more
I want to be able to give them clearly clever captions; to make my chums chortle.


As a user,  
So I can ensure others really understand the deep and meaningful image of a bag blowing in the wind,
I want to be able to give my posts a description

As a user,
I am incredibly busy taking very important  photos,
So I want to be able to sign in via Facebook and save time not having to sign up to yet another website.

As a user,  
I need to know how iconic my posts are and know I have worth in my life,
So I want other users to be able to leave comments on my posts.

As a user,
I want to be able to destroy posts
So that of if in the future I decide that I really shouldn't have included that reeeeaalllllyyy drunk photo I can save face.
```
