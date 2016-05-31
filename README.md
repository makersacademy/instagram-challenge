Instagram Challenge
===================

Project Overview
----------------
The task was to build an Instagram clone. I have included the functionality for sign-up, sign-in and sign-out and amd also looking to handle sign-in via facebook. Once logged in users are able to create a post which consists of a cpation and an image to upload. Posts are displayed on the home page for logged in users. Users can comment on them posts the see. Posts can be deleted and edited by the owner of the post. Comments can be deleted by the comment owner.

Instructions
-------
To install and run locally:
```
$ git clone https://github.com/chriselevate/instagram-challenge
$ cd instagram-challenge
$ bundle
$ rails s
```

Technologies Used
-----------------
- Ruby on Rails
- Devise
- Rspec
- Capybara
- jQuery
- Paperclip

User Stories
------------
```
As a user,
So that I can show off my photos
I want to be able to upload them to the site
```

```
As a user,
So that I can post pictures as me
I want to be able to sign-up
```

```
As a user,
So that I can prevent access to my account
I want to be able to sign-out
```

```
As a user,
So that I can continue to post pictures as me
I want to be able to sign-in
```

```
As a user,
So that I can add notes
I want to be able to leave a comment on photos
```

How I found the challenge
------------
I found this challenge a really good oppotunity to embed and play with the Rails and the technologies learnt so far on this course. I have to admit that in order to get the functionality to work and the styling to look similar to Instagram I needed to use an online tutorial. I found the challenge enjoyable but found using TDD on it incredible hard as I'm not always sure what tests I should be writing and how to successfully make them fail them before making them pass.