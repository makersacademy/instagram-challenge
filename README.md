Instagram Challenge
===================
Author
-------
Sergio Enrech Trillo

Install Instructions
----------------
fork or clone this repo
in the termninal shell, type:

```` 
$ cd instagram-challenge
$ bundle
$ bin/rails server
$ rake db:seed
````
then open a browser and navigate to http://localhost:3000

[or you can take a look online here](https://pichagram.herokuapp.com/)

if you want to test it, (why you would be doing that, but!)
````
$ rake db:setup
$ rspec
````

User Stories
````
As a User,
So that I can share my exciting life with others,
I want to be able to post pictures on a virtual wall online.
````
````
As a User,
So that I can see other people's exciting lives,
I want to see public fotos from others.
````
````
As a User,
So that people know pictures owners,
I want to tag each picture posted with a username.
````
````
As a User,
So that I can see all the pictures of people I like,
I want to be able to filter by username their pictures
````
````
As a User,
So that I can share my thoughts about a picture,
I want to be able to comment on pictures.
````
````
As a User,
So that my embarrassing pictures are not permanent,
I want to be able to delete my pictures.
````
````
As a User,
So that my embarrassing comments are not forever
I want to be able to delete my own comments beneath my pictures.
````
````
As a developer,
So that there are not any orphan comments,
I want all comments to be deleted, if the picture they belong to is deleted.
````
````
As a User,
So that I can show my appreciation for a picture,
I want to be able to like a picture
````
````
As a developer,
So that likes cant be inflated,
I want a user to only be able to like a picture ones.
````

Features
-------
- PostgreSQL as database
- Paperclip gem to manage pictures
- AWS S3 used to store pictures
- Devise for authentication
- Bootstrap gem to make it pretty
- Factory Girl gem to create objects for test
- Simple Form gem to make nice easy forms
- Testing collection tools: Shoulda, rspec, capybara, poltergeist, and database cleaner


Issues
-----
- In local all rspec tests are passing, but Travis CI is not playing ball, it would seem that it is not login in in some cases creating errors.  No time to correct so added to the improvements list
- I managed to break the rspec test set when I added js and poltergeist.  The type of thing that happens to me...  Again added to improvement list to fix when I have a bit of time...

Improvement list
--------
- Resolve issues, (see above)
- Sign up with Facebook (omniauth with devise)
- improve looking on authentication windows
- implement filter options
- improve looking on the like windows
- ensure owner can't like itself (not implemented)
- How to keep your testbed clean and remove the files in the hard drive? (using a bit of "cocaine" gem?)

Special Thanks
-------
To Ben Walkers of https://www.devwalks.com, as I followed the way of the goat!  All the nice looks come from the website from his suggestions of using bootstraps, simple forms and many more.

General Comment & Reflection
------
I discovered how poweful Rails can be, and been humbled by the huge task of mastering it... Anyway with the help of the materials around I was able to put together something that looks like the requested product.  TDD can be pretty difficult in Rails projects, I tried hard during all this week-end trying to get Travis to be nice with me, and failed misserably. I used database cleaner but no difference.  I am puzzled as I don't understand why Travis tells me that I got failing tests that they pass in local... More effort is required!  Will take a look to any successful products done by my fellows to understand how they do it.

The power of Rails is amazing.  If we had tried to implement this in Sinatra it probably would have taken us 2+ weeks of intense work to get the same result.  However Rails is a difficult horse to tame, and it has quite a lot of magic to master.  On top of that I was crazy enough to use HAML for the project, and I almost became insane aligning... Yes, HAML is very clean and elegant, and all the cool kids are doing it but who is aligning all those lines of code?

All in all a good learning exercise, I am amazed of how much work can be done in a couple of days of intense work, (even spending plenty of hours in stupid errors as it is always my destiny).  I need to spend much more time consolidating the use of Rails, but for the moment time to turn my head and start another battle: Angular: you, me... now!


The Task was
--------

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
