# PXLZ
## (A.K.A. Instagram Challenge)

### Duration
2 days

### Approach

Very much a work-in-progress still... it's an Instagram clone. Well, a clone of the Instagram web interface. You can sign up/sign in (including sign-in with Facebook, if you are on my approved list of testers). You can then post images with a caption and comment on images on the timeline. I'm using the Paperclip Gem to handle uploads and a Postgresql database to provide my db needs.
I made a set of user stories which can be read [here](https://docs.google.com/document/d/1K5FblAl-u1s9Cssf38Tfj1guI0UChdFFEbFNw_OOxZ8/edit).


### Testing

The Instagram challenge is being built using TDD. The testing framework used is RSpec. To run the tests, navigate to the root directory using the console and run ```bin/rake spec```.


### Usage

You must have a working PostgreSQL installation on your machine. 

Clone the repo to your local machine:
``` git clone git@github.com:forty9er/instagram-challenge.git```

Create the database and run the migrations:
``` bin/rake db:create ```
and
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
* PostgreSQL
* TDD (via RSpec and Capybara)