Instagram Challenge
===================

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

This is a simple app with features resembling those in Instagram.

Features:
1. The homepage displays all images uploaded to the site.
2. Users can sign up (by inputting email, username and password) and sign in (with a username or with Facebook) and sign out.
3. Once signed in, a user can upload an image, with a caption if desired.
4. Users (when signed in) can delete an image if they added it. If a user attempts to delete an image which was added by another user, an error message is displayed.
5. Users who are signed in can 'like' images (only one time per image), and the image will display how many likes it has.
6. Users can leave comments on images, and the comments are displayed along with the image.
7. Users can delete a comment if they wrote it, but cannot delete comments made by other users.
8. Users can only leave a comment if they have signed in.
9. A user's username appears next to their comment - or the email address does, if there is no username.

Features to add:

1. Editing of comments? Maybe not.
2. Order the pictures in reverse chronological order, so the last uploaded one appears at the top.
3. Improve the styling.
4. Use Amazon Web Services for picture uploads rather than local file structure, so that the app can be deployed to Heroku.
5. Add a tags features so that pictures can be filtered by tag.

Bugs to fix:
- The number of likes is displayed next to the word 'like' or 'likes' according to whether there are 1 or more likes. But the plural/singular updating only happens when the page is refreshed.
