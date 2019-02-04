Instagram Clone
===================

Main feed 

![Main](https://github.com/AlinaGoaga/instagram-challenge/blob/master/app/assets/images/MainPagePic.jpeg)


Show page
![Show](https://github.com/AlinaGoaga/instagram-challenge/blob/master/app/assets/images/ShowPagePic.jpeg)


## My approach

- At the moment the user can: sign up, in, out (devise was used for this)
- Post a new picture with a description, title and image and see this in the main feed (title + image)
- See the show page for an individual picture where the description can also be found

This is still a very simplistic version, still to work on : 

* Feature tests
* Finish working on functionality to remove / edit pics (need to adjust the tests provided by scaffolding in the controller first) 
* Navbar to help with the navigating
* Maybe use carrierwave rather than paperclip since that has been deprecated
* User being able to like pictures and comment on other people's pictures
* etc

## User stories

```
As a user,
So that I can participate on the platform,
I want to be able to sign up.
```
```
As an user,
So that my account stays safe,
I want to be able to log in and log out.
```
```
As an user,
So that I can share my content,
I want to be able to post a picture with a title, description and image.
```
```
As an user,
So that I can enjoy other people's art,
I want all the images displayed on the main page.
```
```
As an user,
So that I can find out more about a specific image,
I want to be able to click on it and see its description and author.
```
```
As a user, 
So that I can share my thoughts,
I want to be able to comment on other users' pics.
```
```
As a user, 
So that I can show my appreciation,
I want to be able to like other users' pics.
```

## Instructions

* clone the repo 
* run bundle
* run rake db:create 
* visit local host at 3000 
* to run tests : rspec in main project folder

## Code Quality

Rubocop is installed 
