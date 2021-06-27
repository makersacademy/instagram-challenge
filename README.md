Instagram Challenge
===================
Build Instagram using Rails.

## User stories

As a user,  
So my content is identifiable,  
I want to be able to **sign-up**.

As a user,    
So I can show off a photo/image,  
I want to be able to **post pictures** from my account.

As a user,
So I can be confident other users won't post as me,
I want to be able to **login and logout**.

As a user,  
So I can engage with other users' content,  
I want to be able to **post comments** about pictures.

As a time-pressed user,  
So I can show love for other users' content,  
I want to be able to **like** a picture with one click.

Nice-to-haves:  
- Style it like Instagram's website (or more awesome).
- Add filters

## Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production 
```
Next, migrate the databases:
```
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```
Visit localhost:3000/bamposts in your browser

## For future releases
I would like to work on deploying to Heroku as I was unsuccessful with this over the weekend.


## Credits
- [*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://www.railstutorial.org/) (6th Edition) by [Michael Hartl](https://www.michaelhartl.com/).

- I referred to the [review document](https://github.com/makersacademy/instagram-challenge) for this challenge during my build.
  
## Code Quality
Linted with Rubocop,
