# README

This is still a work in progress. In its current state it is possible to,

* Add a new photo including a caption
* Photos are displayed via the index view
* Photos can be clicked on to see in show view

The following error is still being returned,

```
1) photos photos have been added viewing photos lets a user view a photo
     Failure/Error: expect(current_path).to eq 'photos/#{@photo.id}'

       expected: "photos/\#{@photo.id}"
            got: "/photos"

       (compared using ==)
```
And I have not yet identified the reason why the images (thumbs on index/and original in show) are not being displayed correctly.

The following functionality is yet to be completed.

* User login via OmniAuth
* Association of User and Photo/caption
* The possibility of adding comments to photos
* Editing of posts
* Liking of posts
* Upload to Heroku

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version ruby version 2.3.3

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
