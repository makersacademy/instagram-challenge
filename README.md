Instagram Challenge
===================

## To run tests
```
$ Bundle install 
```
```
$ Rspec
```
## To run lint
```
$ run rubocop in the terminal of the directory
```
## To run the app
```
$ run "rails s" in the terminal of the directory
```
## User stories 
User stories: 
```
As a user, 
So I can create an account,
I want to be able to sign up.

As a user, 
So I can view images, 
I want to be able to sign in.

As a user, 
So I can make sure I can leave Instagram, 
I want to be able to log out of Instagram.

As a user, 
So I can make a post, 
I want to be able to upload images/post pictures. 

As an avid user, 
So I can see my friend’s pictures, 
I want to be able to view other users’ pictures.

As a user,
So I can get rid of my past, 
I want to be able to delete past posts.

As a fun user, 
So I can add context to a picture, 
I want to be able to update captions for posts.

As a talkative user, 
So I can tell how great my friends are, 
I want to be able to comment on other users’ pictures.

As a friendly user, 
So I can let my friends know they are awesome, 
I want to be able to like other peoples’ posts.
```

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
