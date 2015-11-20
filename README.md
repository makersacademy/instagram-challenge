##Challenge

* Create an Instagram clone that allows users to sign up, upload/delete pictures, like pictures and add/delete comments to pictures.

##Technologies used:

* Development: Ruby on Rails, PSQL, Active Record, Bootstrap, Devise
* Testing: Rspec, Capybara, Factory Girl,

##User Stories

```
As a user,
So that I can see pictures posted by me and others,
I want to see all the pictures that have been uploaded on the homepage.

As a user,
So that I can add pictures to the site,
I want to be able to upload my own pictures.

As a user,
So that I can comment on pictures,
I want to be able to leave comments on any pictures on the homepage.

As a user,
So that I can see comments on pictures,
I want to be able to view all users' comments on the picture's profile page.

As a user,
So that I and others know which pictures I uploaded,
I only want to be able to upload pictures when logged in.

As a user,
So that I and others know what I commented on,
I only want to be able to leave comments when logged in.

As a user,
So that I can change my mind,
I want to be able to delete my own pictures and comments.

As a user,
So that I control my own input,
I do not want other users to be able to delete my pictures or comments.

As a user,
So that I can like pictures,
I want to be able to hit like on a picture.

As a user
So that I can change my mind,
I want to be able to unlike a picture.
```

##Getting Started

####Set up
Please make sure you have postgresql installed on your local machine.

```
git clone git@github.com:zsid/instagram-challenge.git
cd instagram-challenge
brew install imagemagick
bundle
bin/rake db:create RAILS_ENV=development
bin/rake db:create RAILS_ENV=test
bin/rake db:migrate RAILS_ENV=development
bin/rake db:migrate RAILS_ENV=test
```

####Run the app
```
bin/rails s
visit http://localhost:3000
```
#### Tests

* Run ```rspec``` in the terminal

```
Comments
  when there are no comments
    can add a comment to a picture when signed in
    cannot add a comment if not logged in
  when there is a comment
    can edit the comment
    cannot edit someone else's comment
    can delete a comment when signed in
    cannot delete someone else's comment

Likes
  when no likes
    can like a picture
  when there are likes
    can delete a like
    cannot like the same picture twice

Pictures
  when there are no pictures
    should have a prompt to add a picture
    cannot add a picture if not logged in
    can add a picture if logged in
  when creating pictures
    picture's name cannot be shorter than 2 characters
    picture's name cannot be longer than 100 characters
  pictures have been created
    should display the pictures
    can go to the pictures individual page
    can edit a picture
    user cannot edit other people's pictures
    can delete a picture
    cannot delete someone else's picture

Users
  is not registered and on the homepage
    should see links 'sign in' and 'sign up'
    shouldn't see a 'sign out link'
  is logged in and on the home page
    should see 'sign out' link
    shouldn't have 'sign in' and 'sign up' links

Comment
  should belong to picture
  should belong to user

Like
  should belong to picture
  should belong to user

Picture
  should belong to user
  Likes
    should have many likes
    should have many likes dependent => destroy
  Comments
    should have many comments
    should have many comments dependent => destroy
  Validations
    picture's name cannot be shorter than 2 characters
    picture's name cannot be longer than 100 characters
    needs an image to create a picture

User
  should have many comments
  should have many pictures
  should have many likes
```
