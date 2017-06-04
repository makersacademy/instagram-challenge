# Instagram replica challenge

I created a replica of the Instagram App which I called Metalshot as its directed towards a niche of users, Metal music listeners and players.

On Metalshot a user has to sign up/log in to have access to the Shotwall, where every user's uploaded photos are shown. User can post pictures and fill in the 'Title' and 'Description' fields. Once posted, if they go to the Shotwall they'll see their picture published along with their username, title, description, and time/date of the upload. Anyone subscribed can like (only once) and comment shots.

To upload images, I have used the gem Paperclip which, combined with an external storage service such as Amazon S3, enabled me to store the images uploaded on production into an S3 bucket. The App has been deployed to Heroku at the following address:

https://guarded-brook-32059.herokuapp.com/images

Installation
-----------

Clone repository:
```
$ git clone git@github.com:enonnai/instagram-challenge.git
$ cd instagram-challenge
$ bundle install
$ rails/bin server
```

To run the RSpec tests from inside the project folder do:
`bundle exec rspec`

Screenshots
----------
![Screenshot](http://i.imgur.com/)
