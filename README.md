Instagram Challenge
===================

View the app [here](https://whispering-lake-52632.herokuapp.com/)!

## About

This is a simple Instagram clone built using Ruby on Rails. The implementation was inspired by [Devwalks](https://www.devwalks.com/), and has some of the basic features you might expect. These include: user signup, user sign in/out, user posts a picture with a description, user can comment on photos, responsive design. This app has been built from the ground up using a test-driven devlopment approach. Care was taken to consider some edge cases around the posting of comments and photos, to ensure a 'proper user experience'.

As an extension, paperclip would be swapped for Amazon AWS so that image storage would persist (Heroku does not have persistant storage suitable for this app). Also, support for Omni Auth would be added to devise to make user signup even better!

### Some Technologies/Gems Used

- Rails
- RSpec/Capybara
- Rubocop
- Heroku
- Paperclip
- Simpleform
- Kaminari
- SQLite3/PostgreSQL
- Bootstrap/Font Awesome/jQuery
- Factory Bot

## Setup

To have a look at the project locally:

1. Clone the repository
2. Change into the directory
3. Run `rspec` for the tests*
4. Run `bin/rails server` to view the site at http://localhost:3000*

You may need to follow instructions given to setup and migrate any databases. Rails messages are very helpful, so this should not be a problem.

## Instructions

Follow the setup to run locally, or visit the app [here](https://whispering-lake-52632.herokuapp.com/).
