Instagram Challenge
===================
#### Createa a clone of instagram

### Approach

For MVP I started of allowing picture to be uploaded. Once that was completed I added the user and the other core feature, comments and likes. For likes I used the gem acts_as_votable, for which I had to add new controller actions. Before starting wth the styling I refactored my controller and moved a lot of the logic into the model. 

For styling I tried to use scemantic tags however I had trouble targeting them so I replaced them with section tags and added css class/id's. I did not finish with the styling yet.

### Technology used

* Rails
* PostgreSQL
* Devise - User handeling
* Shoulda - Relations testing
* Acts_as_votable - Like function

### Installation

````
* Fork repo
$ bundle install
$ rake db:create
$ rake db:migrate
````

### User Stories

````
As a User,
So that people know about my life,
I want to be able to post pictures on a wall.
````
````
As a User,
So that I can find interesting people,
I want to see public fotos in a public stream.
````
````
As a User,
So that people know who's pictures are on a wall,
I want to sign up and my username is visible beneath each of my pictures.
````
````
As a User,
So that I can see all the pictures of people I like,
I want to be able to click on a screename and see only the pictures of that user.
````
````
As a User,
So that I can share my thoughts about a picture,
I want to be able to comment on pictures.
````
````
As a User,
So that my comments are not permanent,
I want to be able to delete my comments.
````
````
As a User,
So that people cant be mean,
I want to be able to delete comments beneath my pictures.
````
````
As a developer,
So that my DB stays clean,
I want all comments to be deleted, if the picture they belong to is deleted.
````
````
As a User,
So that I can show my appreciation for a picture,
I want to be able to like a picture
````
````
As a developer,
So that likes cant be inflated,
I want a user to only be able to like a picture ones.
````

````
As a User,
Ao tht I can see the public feed,
I want to have a link that gets me back to the public feed
````
