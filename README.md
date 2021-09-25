instaspam the 3rd
===================

https://instaspam3.herokuapp.com/

## User Stories:

**1) People can sign up** 
**2) Users can log in** 
**3) Users can log out** 
**4) Users can post pics**
**5) Users can see pics** 
**6) Users can like pics** 
**7) Users can comments on pics** 
**8) App looks nice** 
**9) Filters!** 

## Setup:

- databases 
- authentication gems 
- picture uploaders 
- AWS for file storage 
- Travis CI 
- Heroku deployment 



## Instructions

* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
group :development, :test do
  gem 'rubocop', '1.20', require: false
  gem 'rubocop-rails'
end
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
