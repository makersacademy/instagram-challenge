Instagram Challenge
===================

Instructions
-------
* Clone repo: https://github.com/KPobeeNorris/instagram-challenge.git
* Brew install postgresql (if not already installed)
  * Note: you may need to start postgresql by typing: brew services start postgresql
* First install this gem: gem install pg -- --with-pg-config=/usr/local/bin/pg_config
* Bundle install
* To build the database type: bin/rake db:create; you may also need to include: bin/rake db:create RAILS_ENV=test if it errors when trying to run Rspec
* Complete the database migration by typing: bin/rake db:migrate
* You can run the app by typing: bin/rails s and going to localhost:3000 in the internet application of your choice

AWS
-----
This application uses AWS services, specifically the s3 bucket for storing the images users upload to the site.  You will need to:
* Create an AWS account
* Navigate to the S3 section and create a bucket
* Create a .env file at the root of the project, and add this to the .gitignore file to keep your data from being made public
* In the .env file you will need to include the following information from your AWS account:
  ```
  S3_BUCKET_NAME=your info here
  AWS_ACCESS_KEY_ID=your info here
  AWS_SECRET_ACCESS_KEY=your info here
  AWS_REGION=your info here
  ```

General information
-----

* App has been deployed to Heroku and the site can be visited at: https://gonna-post-yall.herokuapp.com/
* App has an option to log in via Facebook, but it hasn't been set to public yet so only open to those designated as devs on the Facebook developer site.

Task
-----

Build Instagram.

This weekend I also tried attempted to include CSS and styling for the first time!  It isn't the flashiest site, but I'm really proud of what I managed in a short time!

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
