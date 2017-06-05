# Instagram Challenge

This is a clone of the Instagram social media platform, using Ruby on Rails. It was completed over a weekend as part of the intensive
Makers Academy software development course.

Check me out:
-------------
https://get-instasham.herokuapp.com/posts

Installation:
-------------
Clone me, then:
```
$ bundle install
```
Create and build the database (_requires postgresql_)
```
$ rake db:create
$ rake db:migrate
```

Run the test suite:
-------------------
`$ bundle exec rspec`


User Stories:
-------------
I have written these to allow use of an agile TDD (solo) approach and to identify an MVP:
```
As a user
In order to enjoy spare moments
I want to see photos that interest me

As a user
I want to share photos of my life
So that others can see what I'm doing

As a user
I want to see photos of people I'm interested in
To know what they're doing

As a user
I want my friends to be able to connect with me
So that they can see my photos

As a user
I want to connect with others
So that I can see their photos

As a user
I want to delete a photo I've posted
If I no longer like it

As a user
I want followers to be able to comment on my photos
So that I know what they think about them

As a user
I want followers to be able to like my photos
So that I know which are popular

As a user
I want be to able to like photos
So that I can let others know if I like them
```
Domain Model and Schema:
------------------------
Viewable at:
https://drive.google.com/file/d/0BxpdtSDpsMpCc3F3VmNOM3FIeVE/view?usp=sharing
until I push the image up here.

Technologies:
-------------
* Ruby version: 2.4.0
* Database: postgresql (pg)
* Rails version: 5.1.1
* Linter: Rubocop/ Rubocop-rails
* Testing: RSpec-Rails / Capybara

Dependencies:
-------------
* Factory_girl
* Shoulda
* Paperclip
* Devise
* Simple form

Things I didn't get to write that I want to add:
------------------------------------------
I built a Trello board to manage my own tickets. The user stories tell the story: I want users to be able to <3 photos and comment on photos. I want them to follow others and be followed. I want more comprehensive user account help and login via another portal, like Facebook.
I want, I want, I want...
