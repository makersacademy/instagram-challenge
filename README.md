Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!


Sensible User Stories
-----

```
As a user
So that I can sign up for this madness
I want to use Facebook to sign up

(cause I'm lazy and they are doing a better job at protecting my information than you will,
which is kind of ironic, but still, you know what I mean. They know their stuff, even this markdown
file states Facebook can't be spelled with a lower capital 'f', just obey!)
```

```
As a user
So that I can lose my iPhone without horrible consequences
I want to be able to sign out
```

```
As a user
So that I can retrieve my account on my new iPhone
I want to be able to Sign in
```

```
As a user
So that I can share pictures of iron related things
I want to upload pictures from my account as a post
```

```
As a user
So that I can remove a post I posted while drunk
I want to delete posts I created
```

```
As a user
So that I can ironically show my approval of other posts
I want to 'iron' other users posts
```

```
As a user
So that I can provide context to my liking or disliking
I want to leave a comment on another users post. Preferably in the format of a GIF, if that's like, manageable.  
```
Thanks!


Set up
----

1. Run bundle

2. rails new instagram-challenge -d postgresql -T          OR??

3. bin/rake db:create RAILS_ENV=test

4. bin/rake db:create
