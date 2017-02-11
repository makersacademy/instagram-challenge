# InstaCat
===================

### Instructions

Weekend project - build an Instagram clone using Rails

### How to use

* Clone this repo, and run `bundle install` and `brew install imagemagick` in the project directory
* Run `bin/rails s` to start the server and visit `http://localhost:3000`

### User Stories

```
As a cat owner,
so that I can showcase my cat to the world,
I would like to create an account for him on InstaCat
```

```
As a user who also uses Facebook,
so that I can save time,
I'd like to be able to sign in with my Facebook account
```

```
As a user,
so that I can show off about my cat,
I'd like to be able to upload a picture of him to InstaCat
```

```
As a user,
so that I can show off my sense of humour,
I'd like to be able to write a caption for my cat picture
```

```
As a user,
in case I make mistakes when writing my captions,
I'd like to be able to edit my own captions
```

```
As a user,
so that I can remove any pictures that did not receive enough likes,
I'd like to be able to delete my pictures
```

```
As a user,
so that I can see my picture as well as those of other users,
I'd like to be able to scroll through all the pictures that have been posted
```

```
As a user,
so that I don't have to scroll through the same photos repeatedly,
I'd like the most recent photos to be displayed first
```

```
As a user,
so that I know who has posted a photo,
I'd like to see their username displayed with their photo
```

```
As a user,
so that I can appreciate other peoples cats,
I'd like to be able to 'like' their pictures and see the like count updated in real time
```

```
As a user,
so that I know other people appreciate my cat pictures
I'd like to be able to see how many 'likes' my picture has received
```

```
As a user,
so that I can let people know their cat is cute,
I'd like to be able to comment on a picture
```

```
As a user,
so that I can see the full caption and comments for a picture
I'd like to be able to click on a picture and see it on it's own page
```

```
As a user,
in case I accidentally leave an embarrassing comment on someone's cat picture,
I'd like to be able to edit and delete my own comments
```

### Screenshots

![Imgur](http://i.imgur.com/K0WDff9.png)
------------
![Imgur](http://i.imgur.com/FnvrMg4.png)
------------
![Imgur](http://i.imgur.com/gUvI82n.png)


### Technologies used

* Ruby 2.3.1
* Rails 5.0.1
* JavaScript
* Rspec
* Capybara

### To do

* 'Likes' work in the pictures index but not in the single picture view
* Need to host images on AWS instead of saving to database
* Deploy to Heroku
