Instagram Challenge
===================



## Synopsis

Project to build Instagram using Rails.


## User stories

You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture.

* Users can sign up, log in and sign out
* Users can post pictures - Form to allow users to upload images - where to upload images Amazon web services? (keep secret keys secret)
* Users can post pictures - Images need to be consistent size - also process images to show consistent size
* Users can comment on pictures
* Users can like a pictures



## Technologies Used
- Ruby
- Rails
- Rspec
- Capybara
- Postgres
- ActiveRecord
????


## To run:
- add info to README.rdoc



## User stories
* Users can sign up, log in and sign out (using Devise gem)
* Only users that are logged in can post pictures - Form to allow users to upload images - where to upload images Amazon web services? (keep secret keys secret)
* Users can create a post by providing a title and attaching an image
* Users can comment on pictures
* Users can like a pictures

<!-- The homepage should list all the uploaded thumbnails - users can click through to see full-sized images -->
Images are hosted on S3. Stub calls to S3 for your test environment
Ensure your S3 secret key is not stored on Github


## Job List
* Users can sign up, log in and sign out
* Users can post pictures - Form to allow users to upload images - where to upload images Amazon web services? (keep secret keys secret)
* When posting a picture an image and title should be provided - required form params?
* Images need to be consistent size - also process images to show consistent size (Paperclip?)
* Images on homepage in 3x3 grid (but devise responsive)
* Users can comment on pictures
* Users can like a pictures
* Style website to look like Instagram (or better if possible) - try bootstrap if you run out of time? Resposnive image grid is the key



## Still to complete/refactor
* Bonus if you can add filters!
