Instagram Challenge
=======================

## Task

The aim for this project was to build an Instagram clone using Rails and to style it to look similar to Instagram.


## Functionality

- Users are able to sign up, log in and log out
- Users are able to upload images
- Users are able to comment on images
- Users are able to 'like' images
- Users are only able to delete their own images and comments

- Some styling implemented using Bootstrap


## Still to complete/refactor

- User should only be able to 'like' an image once
- Username should be displayed next to uploaded images and comments
- Further styling to be implemented


## Technologies Used

Code: Ruby
Framework: Rails
Testing: Rspec, Capybara, Shoulda
Other: HTML, CSS, Bootstrap, PostgreSQL, Devise, Paperclip

## Tests

```
comments
  allows users to leave a comment using a form
  user can delete their comments
  user cannot delete other peoples comments

images
  no images have been added
    should display no images
  posting images
    user can see image upload link once logged in
    adds the image to the homepage
  viewing images
    lets a user see uploaded images
  deleting images
    removes an image when a user clicks a delete link
    user cannot delete an image they did not upload

likes
  allows users to "like" an image

User can sign in and out
  user not signed in and on the homepage
    should see a 'log in' link and a 'sign up' link
    should not see the 'log out' link
  user signed in on the homepage
    should see 'log out' link
    should not see 'log in' and 'sign up' links

Comment
  should belong to image
  should belong to user

build_with_user
  builds a comment
  builds a comment associated with the specified user

Image
  should have many comments
  should have many likes
  should belong to user

User
  should have many images
  should have many comments

Finished in 4.78 seconds (files took 9.7 seconds to load)
23 examples, 0 failures
```

