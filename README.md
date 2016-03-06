Instagram Challenge
===================

Project Overview
----------------
The challenge was to build a web-based version of instagram. The project includes functionality for sign-up, sign-in and sign-out as well as handling sign-in via facebook. Once logged in users are able to create a post which consists of a simple title and an image to upload. Posts are displayed on the home page for logged in users. Users can like other posts as well as comment on them. Posts can be deleted and edited by the owner of the post. Comments can be deleted by the comment owner.  

Instructions
-------
To install and run locally: 
```
$ git clone https://github.com/tcpickard94/instagram-challenge.git
$ cd instagram-challenge
$ bundle
$ rails s
```
Screenshots
-----------
Sign in Page:
![login form](https://www.dropbox.com/s/bwo5oc51420zqg5/Screenshot%202016-03-06%2020.05.18.png?raw=1)

Sign up Page:
![sign-up form](https://www.dropbox.com/s/jfj88opcnf4xp4c/Screenshot%202016-03-06%2020.05.36.png?raw=1)

New post page:
![new post](https://www.dropbox.com/s/5pkkbq2bby4k2fj/Screenshot%202016-03-06%2020.07.15.png?raw=1)

Posts page:
![posts page](https://www.dropbox.com/s/ygg4i94lpkpvth9/Screenshot%202016-03-06%2020.11.45.png?raw=1)

Single Post Page:
![individual post page](https://www.dropbox.com/s/b5ccocgi4luprd6/Screenshot%202016-03-06%2020.16.32.png?raw=1)

Technologies Used
-----------------
- Ruby on Rails
- Devise
- Omniauth
- Rspec
- Capybara
- jQuery 
- Paperclip
- AWS - S3

Known Issues
------------
- Users can like as many times as they want
- Likes cannot be undone
- Users who log in with facebook do not have a username  
- Style issue

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
So that I can show appreciation
I want to be able to like photos
``` 

```
As a user,
So that I can add notes
I want to be able to leave a comment on photos
```
