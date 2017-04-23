# Instagram Challenge

This project is a clone of Instagram.

The goal was to enhance my knowledge of Rails and introduce some more advanced concepts:

* Uploading and processing images using Paperclip
* Managing secret information (e.g. private keys)
* Many-to-many relationships in Rails (with tagging)
* Twitter Bootstrap

### User Stories
````
As a User
So that I can use the site
I want to be able to sign up for an account with an email and password

As a user
So that I can link my social media accounts
I want to able to sign up using my Facebook account

As a user
So that I use the site
I want to be able to sign into my account

As a user
So that I can finish using the site
I want to be able to sign out of my account

As a user
So that I can share my photos with other users
I want to be able to post a photo with a description

As a user
So that I can add more of a description to my photo
I want to be able to post a photo with multiple tags

As a user
So that I can share my thoughts on other users photos
I want to be able to post a comment
````

### Future Developments:

````
As a user,
So that I can share appreciations for other users' photos
I want to be able to like their posts

As a user,
So that I can see appreciations for photos others have shared
I want to be able to view the number of likes

As a user,
So that I keep track of likes on the posts
I want to be able to only like a post once

As a user,
In case I like a picture by accident
I want to be able to unlike a post

As a user
So that I can enhance my experience
I would like the website to have a nice layout

````
### Installation Instructions

Clone repository:

````
git clone https://github.com/katiekoschland/instagram-challenge.git
cd instagram-challenge
bundle install
````

Create local databases:

````
psql
createdb instagram-challenge_test
createdb instagram-challenge_development
````
Migrate/upgrade databases:

````
rake db:migrate
rake db:upgrade
````
To run tests:

````
rspec
````

###Technologies Used
````
* Ruby, Rails, HTML, CSS, Devise, Paperclip, Heroku, Postgres
* Tested with: RSpec and Capybara
````
