#Instagram Clone

Ruby on Rails, test driven with RSpec.

Also using:  
* Capybara, shoulda, factory_girl_rails for testing.  
* HTML, CSS, JS and Jquery for front end.  
* Postgresql database.  
* Image upload using paperclip and hosting with Amazon S3.

###Usage
```
git clone https://github.com/hibreez/instagram-challenge.git
cd instagram-challenge
bundle
bin/rake db:setup
bin/rails s
open http://localhost:3000
```

###Features/User Stories  
#####User Accounts
```
As a user
So that I can be indentified when I use the site
I'd like to sign up

As a user
So that I can make posts as myself
I'd like to log in

As a user
So that others can't use my account
I'd like to log out
```

#####Content
```
As a user
So that I can share my photos
I'd like to upload images

As a user
So that I can make my photos look cool
I'd like to be able to add filters to them

As a user
So that I can easily show approval
I'd like to be able to 'like' an image

As a user
So that I can share my thoughts about an image
I'd like to be able to post comments on them

As a user
So that I can have a conversation about an image
I'd like to be able to reply to comments

As a user
So that I can curate my posts 
I'd like to be able to delete them
```

#####UI
```
As a user
So that I can keep up with other users posts
I'd like to see them all in reverse chronological order

As a user
So that I can understand users posts in context
I'd like them to be tagged with a timestamp in a readable format

As a user
So that I can enjoy using the site
I'd like to to be styled awesomely
```
