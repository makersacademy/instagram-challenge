# Instagram Challenge

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to use

```
bundle install
rails db:migrate
rails s
```

## My Approach

I began by diagramming how the databases would link together, as I realised that there would be many relationships between tables.

From there I drew up an MVP, deciding this would just be an application that a user can upload a picture to and then see the picture on the home page, along with all other posted pictures.

After the MVP was complete, I moved on to being able to get users to sign up and authenticated. I used devise, and had this up and running quite quickly.

I then tried to get the User table and Picture table linked together, and have it so that pictures are linked to the user who posted them.

But this is where I started to struggle. I find it incredibly hard to get visibility on what information rails wants, and how to get it once I do know. Querying the database and getting visibility on table relationships and whether they are set up correctly is difficult for me, and I don't exactly know how to go about it.

I really struggle with not knowing what rails is doing in the background of all these processes, and don't understand what info the views need as soon as I nest routes and try and link tables.

Key questions:

* How do I get better visibility in rails?
* How do I link multiple tables together? Multiple has_many relationships?
