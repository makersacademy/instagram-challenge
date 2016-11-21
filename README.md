INSTRUCTIONS:

```
$ git clone git@github.com:[USERNAME]/instagram-challenge.git
$ cd instagram-challenge
$ rake db:setup
$ rspec
$ rake db:seed
$ rails s
$ open http://localhost:3000
```

ABOUT:		

The challenge is to build an Instagram clone as part of the Makers Academy course.

USER STORIES:



MY APPROACH:



FUNCTIONALITY, SCREEN SHOTS AND USAGE:



* XXX


![Screenshot]()


TO DO




USER STORIES

```

SIGN UP

As a User
So that I start showing everyone how awesome my life is
I would like to be able to sign up to InstaGratification

As a User
So that I can save myself the few seconds involved in typing a password
I would like to be able to sign up with Facebook

As a User
So that everyone can see how gorgeous I am
I would like to be able to have a profile picture

PHOTO UPLOAD

As a User
So that I can show everyone how amazing my life is
I would like to be able to upload photos to InstaGratification

As a User
So that I can feel jealous of everyone elses lives
I would like to look at everyone else's selfies and photos of food on InstaGratification

As a User
So that I can can feel more jealous of what I am currently missing out on.
I would like to look at everyone else's photos in order of the most recent. 

As a User
So that I can change my mind about that selfie I uploaded
I would like to be able to delete photos I had uploaded

As a User
So that I don't get trolled
I would like it so only I can delete my photos

As a User
So I can get followers as 'the ultimate gym bunny'
I would like to be able to tag my photos

COMMENTS AND LIKES

As a User
So that I can tell everyone how awesome they are (so they tell me how awesome I am)
I would like to be able to comment on other people's photos

As a User
So that I can see how awesome I am
I would like to be able to see comments that people have made on my photos

As a User
So that I can keep the conversation going
I would like to be able to comment on comments

As a User
So that I don't make a fool of myself when drunk
I would like to be able to delete comments I have made on people's photos

As a User
So that I can have/give that extra bit of appreciation
I would like to be able to like people's photos

As a User
So that I can have/give that extra bit of appreciation
I would like to be able to like people's comments

As a User
So that I know the appreciation is really felt
I would like to only be allowed to like things once

SEARCH

As a User
So that I can find what kinds of pictures people like
I would like to be able to see the most liked pictures at the top

As a User
So that I can find pictures of things I like, like food
I would like to be able to search photos by tags

As a User
So that I can find people I know
I would like to be able to search users by name


```


PROJECT CONTENTS:

For brevity I have omitted many of the standard config files that are created upon initialization of a new rails project.

      Gemfile
			Gemfile.lock
			Rakefile
			README.md

      app directory

          controllers
            XX
          models
            XX
          public
            XX
          views
            index.html.haml
			spec directory
        spec_helper.rb
        web_helper.rb
        rails_helper.rb
				    features directory
              peeps_feature_spec.rb
              signin_feature_spec.rb
              Signout_feature_spec.rb
            models directory
              user_spec.rb



LICENSE:	This project is licensed under the terms of the MIT license.
		see LICENSE.md

AUTHORS: 	Viola Crellin
CONTACT: 	viola.crellin@gmail.com


Below are the instructions I received for this challenge:


Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
