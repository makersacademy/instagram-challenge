# Instagram Challenge

## Instructions

### Via SSH

* `git clone git@github.com:mikehurl/instagram-challenge.git`
* `bundle` from the project directory, then `bin/rails s`.
* Visit `http://localhost:3000` in your browser.

### Via HTTPS

* `git clone https://github.com/mikehurl/instagram-challenge.git`
* `bundle` from the project directory, then `bin/rails s`.
* Visit `http://localhost:3000` in your browser.

### Brief

Week 8 at Makers Academy was our first introduction to Ruby On Rails.
The weekend challenge was to recreate Instagram using Rails.

### User Stories

The user stories I produced and followed are as follows:

```

As a user
So I can show off my artistic side
I would like to be able to upload photos

As a user
So I can provide some context for my photos
I would like to be able to add titles to my photos

As a user
So I can provide further context for my photos
I would like to be able to add descriptions to my photos

As a user
So I can amend mistakes
I would like to be able to edit the titles of my photos

As a signed in user
So I can forgot about embarrassing life-choices
I would like to be able to delete my photos

As a user
So I can entertain myself
I would like to be see uploaded photos

As a user
So I can look at photos in more detail
I would like to look at individual photos

As a user
So I can interact with my fans
I would like users to be able to comment on my photos

As a user
So I can get validation for my photos
I would like users to be able to like my photos

As a potential user
To have access to all functionality
I would like to register

As a user
So I can use the site fully
I would like to be able to sign in

As a user
So I can secure my profile
I would like to be able to sign out

As a user
So I can sign in conveniently
I would like to be able to sign up and sign in with my Facebook credentials

As a user
So I can ensure my profile has integrity
I must sign in to upload photos

As a user
So I can ensure I have control over my photos
I must sign in to edit or delete photos

As a user
So I can have an accurate idea of who likes my photos
I would like users to 'like' a photo no more than once

As a user
So I can engage with my fans
I would like users to be able to comment on my photos

As a user
So I can change my mind
I would like to be able to delete my reviews

As a user
So I can speed up the process
I would like the site functionality to happen asynchronously

As a user
So I can enjoy by the site
I would like it to have styling
```

### Languages, Gems & Technologies

* Ruby
* HAML
* Javascript
* CSS
* Rails
* RSpec
* Capybara
* PostgreSQL
* Devise
* Envyable
* OmniAuth Facebook
* Poltergeist
* Database Cleaner
* Shoulda
* Paperclip

### Future Development

* Limit users to 1 like per photo
* Allow users to 'unlike' photos
* Fix deleting posts
* Filter by hashtag or similar
* Display image in individual views
* Remove empty helper files
* Use local rather than instance variable when redirecting
* Store images with Amazon Web Services
* CSS styling
* Deploy (to Heroku or similar)
