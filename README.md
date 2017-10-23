##How to Use

- Navigate to instagrandma-challenge in command line
- Run bundle (or 'rundle' as the kids call it - you might want to alias that)
- run $bin/rails server
- Open localhost:3000
- Navigate to /feed
- Submit a photo in the form at the top; see it appear below; click the Like button to make likes appear

##Tech Used

- Ruby On Rails for framework
- Rspec-rails for testing (run rspec to see tests)


##User stories

* As a user, so that I can post my selfies, I need a page where I can post pictures to

* As a user, so that I can be harassed online by strangers, I need a space underneath my photo where comments about me and my life choices can be written

* As a user, so that I can gratify my ego, I need a button associated with each picture that counts how many times people pressed that button while thinking of me


##Project Breakdown

* Initiate all the necessary thingamibobs needed for rails (20 mins) - DONE
* Figure out how rails recalls images from a folder (20 mins) [test by printing them to a page] - DONE
* Store image addresses in a database and recall addresses from command line (20 mins) - DONE
* Recall a single image from the database on a View page (30 mins) [test by printing to index] - DONE
* Format page so that all images are recalled in vertically  scrollable way with placeholders for further functions below (20 mins) [test by printing to index]
* Research how ruby on rails can store images to a folder and its location to database (30 mins) - DONE
* Add button to store image to folder and location to database (30 mins) - DONE
* Add an integer field to database that can be changed by submitting a form that updates it with whatever is entered (20 mins) - DONE
* Refactor that to a single button which +1 to that integer, and that integer is zero by default (30 mins) - DONE
* Create Users (60 mins) - DONE
* Get repo working - DONE



Instagram Challenge
===================

## Instructions

* Challenge time: one weekend
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
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
