Instagram Challenge
===================

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

This is a simple app with features resembling those in Instagram.

Features:
1. The homepage displays all images uploaded to the site.
2. Users can sign up and sign in (with an email address or with Facebook) and sign out.
3. Once signed in, a user can upload an image, with a caption if desired.
4. Users (when signed in) can delete an image if they added it. If a user attempts to delete an image which was added by another user, an error message is displayed.
5. Users can 'like' images, and the image will display how many likes it has.
6. Users can leave comments on images, and the comments are displayed along with the image.

Features to add:
1. Restrict actions of users further - only users who are signed in should be able to make comments and like pictures.
2. Add detail to comments - have the user's email address appear next to a comment they have made.
3. Allow users to edit/delete comments which they added, but not comments of other users.
4. Restrict the number of times each user can like a picture to once.
6. Add CSS styling - possibly using bootstrap.
6. Use Amazon Web Services for picture uploads rather than local file structure, so that the app can be deployed to Heroku.
7. Add a tags features so that pictures can be filtered by tag.
