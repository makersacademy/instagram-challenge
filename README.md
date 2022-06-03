**INSTAGRAM-CHALLENGE:**  
This is a variation on the instagram website. It allows a user to save pictures into galleries.  
At this point in time the functionality is not complete.  
Refer to the user stories below to see what is still outstanding. 

**USER STORIES:**  
```
As a user (logged in)  
So that my pictures are secure  
I would like to be able to securely log in  

As a user (logged in)  
So that I can show my pictures  
I would like to be able to be able to upload my pictures  

As a user (logged in) - NOT YET COMPLETE!  
So that I can be entertained  
I would like to be able to add comments to all pictures including my own pictures.  

As a user (logged in)  
So that I can show my best pictures  
I would like to be able to delete galleries that I no longer want to show (but not other people's galleries)  

As a user (logged in)  
So that I can show my best pictures  
I would like to be able to delete the pictures that I no longer want to show (but not other people's pictures)  

As a user (logged in) - NOT YET COMPLETE!  
So that I fairly vote on pictures I like  
I would like to be able to vote once for the pictures that I like (but not my own pictures)  

As a website visitor (not logged in) and a user (logged in) - NOT YET COMPLETE!  
So that I can be entertained  
I would like to be able to view all users and their pictures  

As a website visitor (not logged in) and a user (logged in) - NOT YET COMPLETE!  
So that I can be entertained  
I would like to be able to search for a particular user's pictures  

As a website visitor (not logged in) and a user (logged in) - NOT YET COMPLETE!  
So that I can be entertained  
I would like to be able to shuffle the order of all users pictures  

As a website visitor (not logged in) and a user (logged in) - NOT YET COMPLETE!  
So that I can be entertained  
I would like to be able to see the most recent users pictures  
```
**INSTRUCTIONS:**
```
$ git clone git@github.com:glynester/instagram-challenge.git
$ cd instagram-challenge
$ rake db:setup
$ rspec
$ rake db:seed
$ rails s
$ open http://localhost:3000
```

**SCREEN SHOT:**  
![Alt text](https://www.dropbox.com/s/jlmoyfaxils6wej/instagram-challenge.png?raw=1 "Optional title")

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Instagram Challenge
===================

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
