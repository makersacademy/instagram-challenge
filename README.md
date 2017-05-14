BlundellGram
============
![Travis CI](https://travis-ci.org/Simba14/instagram-challenge.svg?branch=master)

A Rails web application cloning the wonders of Instagram, AKA a space that allows users to upload, comment, and like photos.

![Home](http://i.imgur.com/bjcOE6R.png)

Setup
---
Download or clone this repo, and open the BlundellGram folder.

In your terminal, in order to install the required gems, run: ``` bundle install. ```

Then type in  ```bin/rake db:migrate``` to create the neccessary databases.

Then to run the server, use ```bin/rails s``` and visit http://localhost:3000/ on your browser to begin interacting with BlundellGram!

User Stories
---
```
As a User,
So that I can use all of BlundellGram's functionality,
I want to sign up for BlundellGram.

As a User,
So that I can interact with BlundellGram as myself,
I want to log in to BlundellGram.

As a User,
So that I can avoid others using my account,
I want to sign out of BlundellGram.

As a User,
So that I can share my photos,
I want to upload them onto BlundellGram.

As a User,
So that I know what others have been photographing,
I want to view their photos.

As a User,
So that I can get more context about a photo,
I want to know the location where it was taken.

As a User,
So that I can garner the recency of a photo,
I would like to see how long ago it was uploaded.

As a User,
So that I can follow photographers I like,
I would like to see who uploaded the photo.

As a User,
So that I can indicate my appreciation for a photo,
I want to be able to like it.

As a User,
So that I can give my thoughts on a photo,
I would like to be able to comment on it.

As a User,
If I no longer wish to have my photos on Blundellgram,
I want to be able to remove my photos from Blundellgram.

As a User,
If I want to edit the details of an existing photo,
I want to be able to edit that photo.
```

Edge Cases
---
* User must be signed in to upload, commment or like photos
* User can only like each photo once
* Only the owner of a photo can edit/delete a photo
* Users cannot leave empty comments

Additional Features
---
Using the Ominauth Gem, I have enabled users to sign up/in using their Facebook.
![Log in](http://i.imgur.com/baboKDl.png)

This challenge was a great opportunity to sharpen my CSS skills and I now feel I have a far better understanding of the workings of flexbox and how to display elements in-line.

![Display](http://i.imgur.com/ZhDLRDe.png)
