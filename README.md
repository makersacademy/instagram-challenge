Instagram Challenge
===================

Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----
To build Instagram

Completed
-----
* A user can upload a picture to the website
* All users can see all the pictures uploaded
* A photo can be deleted
* A user can add a description to their picture when they upload it
* A user can add a comment
* The comment is shown under each picture
* A user can delete the comment
* Deleting a photo deletes the comments as well
* A user can sign in, and out of the website
* Only users that are signed in can upload a picture
* only the photos owner can delete the photo
* only the comment owner can delete the comment
* The time when the picture was uploaded is added in the description
* A user can comment on someones else picture
* The comment includes the username of the person and the time ago since it was made
* pictures are stored in AWS
* A user can like a picture
* The number of likes a picture has is shown
* The username of the people that like are shown next to the like
* A user can only like a picture once
* pictures are shown in reverse order, newest first
* The like button is a heart
* Users can add a filter to their pictures
* filters are added dynamically










Todo
-----
* test for dynamic filters
* Comments, likes are added without moving to another page
* The site uses foundation
* The site looks like Instagram

Questions
-----
- Turbolinks?
- Why is AWS so slow to upload?
- For finding usernames - where is the right place to put the method? is it a User class method? how does it sit under the photo for example, or in the view?
- At the moment I'm hiding links based on whether the current user has done x or y - but this also means that I have to ask if there is a current user (e.g), or not show them. A better way of doing it?
- what is the form_for helper doing? when in takes in an element such as |f|
- how to use the asset library - where to place the css bits?
- 

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by


Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
