Instaz
=======================
[![Code Climate](https://codeclimate.com/github/zdajani/Instaz/badges/gpa.svg)](https://codeclimate.com/github/zdajani/Instaz)
## Synopsis

A basic photo sharing platform based on [Instagram](https://instagram.com/) using Rails. 

With the following core features: 

- Uploading pictures 
- Leaving comments
- Liking pictures
- User authentication (log-in and log-out)

## Technologies and Tools Used

- Language: Ruby
- Framework: Rails
- Database: Active Record, PostgreSQL, Database Cleaner
- Testing: Rspec, Capybara, Poltergeist, Shoulda, Factory Girl
- Other: Devise, Paperclip, Haml, CSS, Bootstrap, 

## User Stories

```
As a user,
So that I can see pictures posted by others,
I want to see a pictures feed on the homepage

As a user,
So that I can add pictures to the site,
I want to be able to upload my own pictures

As a user,
So that I can comment on pictures,
I want to be able to leave comments on pictures on the homepage 

As a user,
So that others and myself know which pictures I added,
I want to be able to login to the website with a username

As a user,
So that I can see comments on pictures,
I want to be able to view comments on the homepage

As a user,
So that I and others know what I commented on,
I only want to be able to leave comments when logged in

As a user,
So that others and myself can see only the pictures I uploads, 
I want my username to link to my own page

As a user,
So that I am the only one that can delete pictures I uploaded,
I want to be able to login and delete a picture 
      
As a user,
So that I can like pictures,
I want a like button on each picture
```

## How to run

- Clone or fork the repo <https://github.com/zdajani/Instaz.git> to your local machine
- Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and Ruby on Rails `gem install rails`  
- On the command line run `bundle install` to install all required gems locally
- View it on your local host through the rails server by running `rails s` on the command line
- Run tests using the command line `rspec`


## Still to complete/refactor

- Use AWS to host pictures
- Improve front-end styling
- Enable comment deletion
- Add more validations on liking
