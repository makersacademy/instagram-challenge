#StieglitzGram


I have named my instagram clone after Alfred Stieglitz who is regarded as being  responible for making photagraphy an accepted art form.
At the time photography was seen as hobbyists pastime for bicycle clubs to record their travels. Stieglitz was instramental in getting fine art institutions (most notably MOMA) to the show the work of photographers alongide painters and sculptors.  He was was also married to painter Georgia O'Keeffe

Installation


```sh
git clone the repo git@github.com:ljones140/instagram-challenge.git
#in directory run
bundle install
```

I have git ignored the photos I used for testing. You need to add them to /spec/assets_specs/photos/ if you would like to test images. You will also need to ensure the file names match those in the test that use photos

user stories

```
As a candid phototographer
so I can show people my photos
I want to post my photos to StieglitzGram

As a candid photographer
So that I can post photos on StieglitzGram
I would like to join up to StieglitzGram

As a candid photographer
So that I can post photos as me
I want to log into StieglitzGram

As a candid photographer
So that I can avoid others posting as me
I want to log out of StieglitzGram

As a candid photographer
so I can tell other photographers what I think of photos
I would like to comment on any photo

As a candid photographer
so that I can indicate wether I like a photo
I would like to be able to add a like to any photo

As a curator of photography
so I can see which photos are popular
I would like to be able to see the count of likes per photo

As a curator of photography
so that the popularity is fair
only members of StieglitzGram are allowed to like photos

As a curator of photography
so that the popularity is fair
Each member should only be able to like a photo once

```
To implement in next version
----------

* Sign in with facebook
* stub out images in test
* See list of users who have liked photo
* comments entery form below each photo
* show limited amount of comments
* host photos on AWS
* test and ensure comments and photos are ordered correctly

Lessons learnt
--------------

* factory girl set up with rails. Install factory girl at start of project and it will build the factory template files for you as you add
* git ignore the photos directy so they are not uploaded to git hub
* Phantom JS for javascript testing with capybara
* If using phantom js in a test it affects factory girl factories. If you call them inside test block they will not be recognised.
* Rails association and how to bring log to the model where needed.
