# Makergram

Makergram is a clone of Instagram using Rails. Users can post pictures, write comments on pictures and like a picture. 


# Installation  

Begin by cloning this repository to your local machine. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate
> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

# Deployment with Heroku

- Prerequite 
  - heroku CLI

```bash
> heroku create
> git push heroku master
```