# PXLZ
## (A.K.A. Instagram Challenge)

### Approach

Very much a work-in-progress still... it's an Instagram clone. Well, a clone of the Instagram web interface. You can sign up/sign in (including sign-in with Facebook, if you are on my approved list of testers). You can then post images with a caption and comment on images on the timeline.
I made a set of user stories which can be read [here!](https://www.github.com). https://docs.google.com/document/d/1K5FblAl-u1s9Cssf38Tfj1guI0UChdFFEbFNw_OOxZ8/edit).


### Testing

The Instagram challenge is being built using TDD. The testing framework used is RSpec. To run the tests, navigate to the root directory using the console and run ```bin/rake spec```.


### Usage

You must have a working Postgresql installation on your machine. 

Clone the repo to your local machine:
``` git clone git@github.com:forty9er/instagram-challenge.git```

Create the database and run the migrations:
``` bin/rake db:create ```
``` bin/rake db:migrate ```

Run Bundler to install Gems:
``` bundle ```

Navigate to the root directory in the terminal and spin up the server:

``` rails s ```

(Nb. If you start the server using ```rails s -b 0.0.0.0``` and forward port 3000 on your router you can access the server over the internet).

Navigate to ```http://localhost:3000``` in your browser.

You can log in if you are already registered (nb. Facebook log in will not work unless I have listed you as a tester with Facebook, if you are using locally you will need a .env file with your Facebook App ID and secret in the root of the project. See the dotenv Gem usage):
![Log in](https://www.dropbox.com/s/445lq1308mquztb/PXLZ-log-in.png?raw=1)


sign up:
![Sign up](https://www.dropbox.com/s/fjs0uxsm3zb5a8t/PXLZ-sign-up.png?raw=1)


view timeline:
![View timeline](https://www.dropbox.com/s/oo3h0jv82wmt5p2/PXLZ-timeline.png?raw=1)


view comments:
![View comments](https://www.dropbox.com/s/04hxqs47ufs2uu0/PXLZ-view-comments.png?raw=1)


upload a new comment:
![Upload comment](https://www.dropbox.com/s/46da2gzud0826v0/PXLZ-upload-comment.png?raw=1)

### TODO

* 'Like' pictures
* Add time of posting
* Reverse order of posts
* Remove unneccessary routes
* Add crop image on upload
* Add filters on upload
* Full code-review and clean-up
* Images hosted on Amazon AWS
* Bootstrap front-end
* Deploy to Heroku
* Add username to sign up
* Add user profile page
* Add/change user avatar
* Add tags
* Add search for tags


### Technologies used

* Ruby on Rails
* Postgresql
* TDD (via RSpec and Capybara)






# Original instructions

Instagram Challenge
===================

Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
* Forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
