# Instagram Clone

I started off by loosely going through what user stories I'd want. This turned into a list of feature and unit tests. I didn't do any unit tests in the end due to time constraints as I stupidly deleted all my work by accident (don't code tired) for Saturday and had to do everything in one day.

Visit this repo to see deployed app: https://github.com/allthatilk/immstagram_heroku

## This is the list I had for tests:

*Means this feature is an option extra if I had time.

### Feature tests

* Users can sign up
* Users can sign in
* Users can sign out
* Only signed in users can upload or delete images
* Only signed in users can view images
* Each user can only delete their own images
- *Each user can only edit their own images
* Users can comment on images
- *A user can edit or delete their own comment
* Users can like images
- *A user can unlike an image they have liked
* Users can only like an image once
* Users can make multiple comments

### Unit Tests
* Users can only upload images (restrict format?)
* Users have many pictures
* Pictures belong to users
* Pictures have many comments
* Comments have one picture
* Pictures have many likes
* Likes have one picture
* Comments belong to users
* Likes belong to users

I used Ruby 2.3.3 and Rails 4.2.6 with a postgresql database and RSpec and Capybara for testing.

I used Dragonfly for the image uploading as it seemed like a very fast and efficient solution with relatively simple implementation.

## Things I would add if I had more time:
* Image validation
* Proper usernames (atm it just uses your email before the @)
* Unclicking your like
* Image filters
* Image editing
* Have Like button change depending on number of likes to be correctly pluralised

## Things I would change if I had time
* Use AJAX instead of page refreshes
* Have a show/hide button instead of password confirmation
* Tidy up the way the app routes
* Tidy up the CSS with classes and JQuery

