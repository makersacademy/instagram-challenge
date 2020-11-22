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
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!

## User Stories

```
As a user, 
To access 'YEET' securely,
I would like to be able to sign-up.

As a user,
So that I can choose how people see me,
I would like to be able to set my username upon sign-up.

As a developer,
So that users do not create fake accounts/to mitigate that,
I would like users to verify their email to complete sign-up.

As a user,
So that I can ensure no one else posts from my account,
I would like to be able to log out.

As a user,
So that I can post from my account,
I would like to be able to sign-in.

As a user,
In order to show the world my perspective,
I would like to be able to post a picture with a caption.

As a user,
So that I can see pictures other than my own,
I would like to be able to shown a 'timeline' of other user's photos.

As a user,
So that I can let others know when I like their pictures,
I would like to be able to 'like'/react to any post.

As a user,
So that I can compliment others or ask questions,
I would like to be able to comment on another user's photo.

As a user,
So that I can answer questions,
I would like to be able to respond to comments on my own photo.

----
As a user,
So that I can see which of my photos are popular,
I would like to be able to see how many likes each post has.

As a user,
So that I can see when someone likes my photo,
I would like to receive a notification.

As a user,
So that I can get another user's attention,
I would like to be able to tag them in a comment.

As a user,
So that I can see when I'm being referred to,
I would like to be able to receive a notification when I have been tagged.

```


