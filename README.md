Idstergram
===================

**Your New Basic Urge**

## Introduction
Idstergram is a web app where self-important ego-maniacs can convene to share and revel in their bloated sense of self-worth.


## Online Access and Local Set Up
The app has been deployed via Heroku in Staging and Production environments.
* Staging: https://idstergram-staging.herokuapp.com
* Production: https://idstergram.herokuapp.com

To set up local Testing and Development environments on your computer, do the following:
1. Clone this repo: `git clone git@github.com:julesnuggy/instagram-challenge.git`
2. Install the require gems: `bundle install`
3. Create the local databases: `rails db:create`
4. Migrate the table structures: `rails db:migrate`
5. Run the RSpec tests to ensure it will work: `rspec`
6. Boot the local server: `rails server`
7. Visit the localhost from your browser (usually http://localhost:3000)


## Userstories

These can be found [here](Userstories.md).


## Project Planning
Trello card wall here: https://trello.com/b/OFIqEzS4/idstergram


## Original Task Description

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
