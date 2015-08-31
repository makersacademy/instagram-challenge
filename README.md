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

Features to add:
1. Only let signed in users leave comments. 
2. Add detail to comments - have the user's username appear next to a comment they have made.
3. Allow users to edit which they added, but not comments of other users.
4. Order the pictures in reverse chronological order, so the last uploaded one appears at the top.
6. Improve the styling.
6. Use Amazon Web Services for picture uploads rather than local file structure, so that the app can be deployed to Heroku.
7. Add a tags features so that pictures can be filtered by tag.

Bugs to fix:
- The number of likes is displayed next to the word 'like' or 'likes' according to whether there are 1 or more likes. But the plural/singular updating only happens when the page is refreshed.
