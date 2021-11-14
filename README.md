# Instagram Challenge

## User Stories
```
As a user
So I can join Instagram
I want to be able to sign up
```
```
As a user
So I can make a post
I want to be able to sign in
```
```
As a user
So I can end my session
I want to be able to log out
```
```
As a user
So I can share photos
I want to be able to post a photo to the feed
```
```
As a user
So I can appreciate posts
I want to be able to like them
```
```
As a user
So I can leave feedback
I want to be able to write comments on posts
```

## Stack

|                                                                  | Tool                                                 | Use?                                       | Where can I see it?                                              |
| ---------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------ | ---------------------------------------------------------------- |
| <img src="public/images/rspec.png" height="auto" width="50">     | [RSpec](https://rspec.info/)                         | RSpec is a computer domain-specific language testing tool used to test Ruby code.                      | `/spec/*` Unit tests for the app's classes.                      |
| <img src="public/images/capybara.png" height="auto" width="50">  | [Capybara](https://github.com/teamcapybara/capybara) | Capybara is a web-based test automation software        | `/spec/features/*` Feature testing for the app. e.g. Sign in/out |
| <img src="public/images/psql.png" height="auto" width="50">      | [PostgreSQL](https://www.postgresql.org)             | PostgreSQL is an open-source relational database management system                  | `/db/migrations/*` In the SQL commands below.                    |
| <img src="public/images/rails.png" height="auto" width="50">     | [Ruby on Rails](https://rubyonrails.org/)               | Rails is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern. | -----  |
| <img src="public/images/tailwind.png" height="auto" width="50"> | [Tailwind CSS](https://tailwindcss.com/)               | A utility-first CSS framework      | Frontend design

## Workflow
```
$ rails g scaffold User username:string email:string password_digest:string
```
```
$ rails g scaffold Post message:string
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
