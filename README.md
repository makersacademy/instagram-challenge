Instagif
===================

A Rails web application that uses the GIPHY API.

Instagif allows users to generate gifs based on a word or phrase of their choice, which is then displayed on a public stream.

Setup
------

Download or clone repo, open the instagif folder and run `bundle install`.

Run `rake db:migrate` to create the databases, then run `rails s` and visit `localhost:3000` on your browser to begin instagif-ing!

Note: you have to create an account and log in to be able to post gifs!

Screenshots
-----

1. Home Page

![Screen shot of Home page](https://github.com/AlexJukes/instagram-challenge/blob/master/images/Screen%20Shot%202017-05-14%20at%2018.43.19.png?raw=true)

2. Generator

![Screen shot of generator form](https://github.com/AlexJukes/instagram-challenge/blob/master/images/Screen%20Shot%202017-05-14%20at%2018.29.26.png?raw=true)

3. New Post

![Updated Home Page](https://github.com/AlexJukes/instagram-challenge/blob/master/images/Screen%20Shot%202017-05-14%20at%2018.29.38.png?raw=true)

Known Issues
-----

- App crashes if GIPHY returns no results from search.

- Further styling needed, especially on individual post pages.

- Asynchronous loading of comments not yet implemented.

- Comments do not belong to users who made them.

- Comments do not have a time of posting associated with them.
