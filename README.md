# Instragram Challenge

*[Exercise instructions](instructions.md)*

## Installation instructions

Clone this repo. Then:

```
bundle install
bin/rails db:create
bin/rails db:migrate

bundle exec rspec # Run the tests to ensure it works
bin/rails server # Start the server at localhost:3000
```

## Features implemented

Bit of a rush this one, but I've implemented user sign up and authentication using Devise, posting pics and commenting, and pics and comments are associated with users. Not much in the way of testing going on!

