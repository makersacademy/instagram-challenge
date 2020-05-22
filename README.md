# Instagram Clone

Task
----
Create an Instagram clone which allows users to view a gallery of photos posted by themselves and others users.
Users can add photos, view photos, comment and like photos and click on a user to view photos posted by that user.

Quickstart
----
This is a web application that runs on Ruby 2.6.3 and Rails 6.0.2. To get started, clone this repository and run the following code in your terminal:
```
bundle install
rails db:create
rails db:migrate
rails server
```
You will be taken to the Explore page, which is a gallery of all photos posted by users, displayed in reverse chronological order and accessible to all users regardless of whether they're logged in or not.

To either register as a new user or log in with an existing account, click the Log in link on the navigation bar.

Once logged in you're taken to your Profile page. Here you will be able to see your own pictures as you build up a gallery.

To add your first picture click Add Picture on the navigation bar. This will take you to a page that lets to upload a picture and add a caption. Clicking Create Picture will take you back to your Profile page (or whichever page your were on before).

When you Explore you can like any picture in the gallery by clicking on the heart underneath each photo. You can also click on the picture where you can comment on the picture and view all the other comments.

Future improvements
---
- When not logged in, add a link in the navigation bar for sign in (or perhaps the link could say 'new user?') to reduce the number of clicks required to become a new user.
- As a new user, when taken to the profile page, have a 'getting started' message to allow users to get up and running quickly. Include in this message instructions on how to add photos, and find and comment on other users photos.
- Comments on photos should be ordered with newest comments at the top so you don't have to scroll down to see new comments.
- Deploy to Heroku
- Improve the testing suite
- Set up Travis
- Set up Rubocop
