## Access on heroku

https://extragram-1.herokuapp.com/

## To run locally:
```
  > bundle install
  > bin/rails db:create
  > bin/rails db:migrate
```

To access on http://localhost:3000/ :
```
  > bin/rails server
```

## Technologies used:
Ruby on Rails, Bootstrap, PostgreSQL, RSPEC, Capybara

## Features:
- visitor can add a post
- root page shows all posts with image, description and author

## Features in development:
- user can like posts
- user authentication
- user can add comments to posts

## Reflections:
- lots of time spent on fixing Heroku - creating a Procfile was essential to prevent it from crashing
- similarly with Github actions, creating a Github workflow file was time consuming but made everything smooth - it executes database migrations and installs specific versions on dependencies
- Bootstrap seemed relatively easy to use

## User stories:

```
As a user
So I know whose posts I am seeing
I want to see person’s name next to each post
```

```
As a user
So that I can be cool
I want to post an image on Extragram with a description and my name
```

```
As a user
So that I can get famous
I want others to be able to like my pictures
```

```
As a user
So that I can get some attenion
I want to be able to leave a comment on any post
```

```
As a user
So I am not embarassed using Extragram
I want it to look cool
```

```
As a user
So that no one pretends to be me
I want to be able to sign up, sign in, sing out
```

<p style="text-align: center">
  <img src="https://i.imgur.com/ZHVzj0G.gif">
</p>


## Database model:
<p style="text-align: center">
  <img src="https://i.imgur.com/MmRGaHM.png">
</p>

### Edge cases considered:
  - Adding a post
    - user can only add jpeg or png
    - image, content and author are required fields

### Edge cases to consider:
  - Liking a post
    - user can only like an image once
  - Signing up
    - user can't sign up on the same email
    - user password has to be 6-10 characters long