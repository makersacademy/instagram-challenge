# Momentgram
Momentgram represents the implementation of Makers Academy weekend challenge of recreating Instagram using Ruby on Rails.

## Approach
I started this challenge by thinking what functionality the MPV should have, followed by creating the user stories. The MVP was designed to have the following functionalities: posting and deleting picture (model picture), user can sign-up, login and logout(model user). After that I had expanded the MVP, by adding comments and likes.

## Setup
- $ git clone  https://github.com/gabrielabud/instagram-challenge.git
- $ bundle install
- $ bin/rails db:setup
- $ bin/rails s

## User Stories
The following user stories have been implemented.
```
As an user
so that I can use Momentgram for the first time
I'd like to have the option to sign-up

As an user
so that I can use Momentgram
I'd like to have the option to login

As an user
so that I prevent other from using my Momentgram's account
I'd like to have the option to logout

As an user
So that I can share moments captured on camera
I'd like to upload pictures

As an user
So that I can reorganise the posts
I'd like to delete the pictures I have uploaded

As an user
So that I can communicate my thoughts on a picture
I'd like to be able to write comments

As an user
So that I can change my mind on a comment I just posted
I'd like to be able to delete comments

As an user
So that I can give feedback on images
I'd like to be able to like photos
```

## Further improvements
If I had more time, I would have also added the following:
- filter pictures by tag;
- a user page, where only the user's pictures are shown;
- the option to follow users and only see their posts;
- features tests, which I did not approach;
- API;
- deployment to Heroku;

## Home page
![Homepage](/images/home.png)

## Post picture
![Post](/images/add_picture.png)

## Delete only pictures that have been posted by the logged-in user
![Delete](/images/delete_user_picture.png)

## No delete option for pictures which don't belong to the logged-in user
![NoDelete](/images/no_delete.png)

## Comment and like pictures
![CommentsLikes](/images/comments_likes.png)

## Login
![Login](/images/login.png)
