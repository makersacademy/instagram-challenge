README Edit: My approach and code review
=================

My approach
------
Pre-code:
* First, I divided the whole challenge into User Stories:

```
As a web surfer
So that I can start using Finchstagram
I want to be able to register and log in

As a user
So that I can share my moments with others
I want to be able to post pictures

As a user
So that I can give my opinion about pictures
I want to be able to write comments

As a user
So that I can indicate that I enjoyed a posted picture
I want to be able to like it
```

* Then, I worked on the Domain Modelling. To achieve my MVP for this challenge I would need two models:
Users that can post **pictures** and pictures that can have **comments** and likes
* I wrote down the specific attributes my models would need and also the relations among them:

**MVP**

```
Pictures (can have many comments)
- pic:string
- description: string

Comments (belong to a specific picture)
- comment:string
```

Development:
* I started by creating the Picture model. First, I wrote feature tests for the whole CRUD to make sure the user can add pictures and see them on the index, delete and update them.
* Then, I created the Comment model and tested it.


**MVP 2**

```
Users (can have many pictures)
- devise gem

Likes (belong to a specific picture and to a specific user)
- a picture cannot be liked twice by the same user, checking uniqueness
```

Development:
* I implemented the Devise gem to handle authentication, which made me change my tests and add new helpers to make them more readable.
* I also modified the DB Schema with the new relations and kept updating it until Likes were added.

Next focus
------
* Same as I did for the Like model, I would refactor the Comment one and get rid of the scaffold there, there are a bunch of controller methods that I am not using at all for that one, therefore it makes more sense to have searate methods maybe inside the Pictures controller.
* I would need to think about adding some more tests. For example, I haven't tested the log-in functionality because with Devise, signing-up means logging-in as well automatically, the session is there and therefore I am relying on the gem working, rather than seeing if the functionality has a specific behaviour.
I honestly prioritised getting a sense of how Rails work this week rather than following a TDD approach. I was carefully testing all my moves with the help of RailsPanel in Chrome though.
* Some more CSS would be also a good idea to work on, but it was not a priority for me at all.

Personal code review
------
* I could have probably started the challenge with the authentication, as everything is based on it. Anonymous users should not have access to posting pictures, commenting on them or even liking them, so it makes sense to start from the User.
* I am sort of satisfied as I prioritised learning about nested relations within models and different types of requests. Also about the general architecture within Rails.

* Overall, I feel like a better planning could have helped me getting the challenge done faster and in a better way.
* Finally, something really important to consider is the **Complexity** of whatever is being done at some point in the project, the brain cannot hold everything and make connections with everything if I start jumping rather than breaking down the processes into small chunks. I consider this to be one of my weaknesses sometimes, and definitely something I need to work on.

Tech Stack
------
* Ruby on Rails
* RSpec
* Devise
* Sqlite3
* RailsPanel

How to run the app
------
* Install Rails if you haven't yet, run `$ gem install rails`
* Fork & Clone the repo
* Run `$ bundle install` from the project directory
* Migrate the Database by running `$ rails db:migrate`
* Start the server: `$ rails s`

How to run the tests
------
* Run `$ rspec spec/features -fd` from the project directory

* Note: I used a web_helpers.rb file to abstract repeated bits to run the different feature tests, for example: signing-up, creating a picture (valid and invalid) and creating a comment (valid and invalid)
* If you are curious to see how I did it without harcoding user input into the tests directly, take a look at the files under finchstragam/spec/features and also at finchstragam/spec/helpers/web_helpers.rb
* The rest of the test directories/files were created using a Rails generator

Screenshots
------
![News](/finchstragam/public/screenshot.png?raw=true)

===================
===================


Instagram Challenge
===================

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.
