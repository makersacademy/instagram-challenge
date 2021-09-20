# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# User Stories

"As an instagram user I'd like to be able to create an account"

"As an instagam user I'd like to be able to upload photos"

"As an instagram user I'd like to be able to put a caption under my photos"

"As an instagram user I'd like people to be able to like my photos"

"As an instagram user I'd like people to be able to leave comments on my photos"

# Database Structure

Tables - 
* USER
 - Username, email, password
* IMAGES
 - Using Active Storage to store images (foreign key, User ID)
* POST
 - Post description, (foreign key, User ID) (foreign key, Image ID)
* COMMENTS
 - Comment (foreign key, User ID) (foreign key, Image ID)
* (Potential) Likes?
- Likes (foreign key, User ID) (foreign key, image ID)