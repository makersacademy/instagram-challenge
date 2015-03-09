# Instagram Challenge
=====================

### Makers Academy Week 9 Weekend Challenge
-------------------------------------------

First solo project using Ruby on Rails to build a photo sharing 'Instagram' clone. I created Snapshot!

### Technologies Used
---------------------

- Ruby on Rails
- Rspec and Capybara for testing
- HAML for HTML
- S3 AWS Web Storage for Images
- Paperclip for file upload

![Snapshot! Screenshot](https://github.com/andygnewman/instagram-challenge/blob/master/Snapshot%20Screenshot.png)

### To run the programme
------------------------

From the command line `$ rails server` then in the browser open [http://localhost:3000] (http://localhost:3000)

### To run the tests
--------------------

From the command line `$ rspec`

### What I learnt from undertaking this project
----------------------------------------------

- The power of the Rails framework, especially for creating applications based on relationship models, for example in this case a user has Snapshots!, can leave comments on other users Snapshots! and can 'dig' (or like) Snapshots!
- However it needs a good understanding of how it is doing it - relational database / Active Record and routings (Model View Controller), so was glad to have undertaken projects in Sinatra / Postgres (DataMapper) to give a good grounding.

### Things I would do to improve this project
---------------------------------------------

- This was Behaviour Driven Development, with little Unit Test coverage of models / data handling, which I would seek to address.
- Still some business logic in the controllers which should be moved into models.
- Using the inbuilt devise functionality to authenticate users before specific actions (as there is vulnerability in users being able to navigate to these pages without logging in which would crash the system. (eg. - before_action :authenticate_user!, except => [] for comments, digs)
- I didn't manage to get S3 storage working for the images (hence many image not founds), whilst the image files are being stored there, there is an issue in rendering them on the page.
- Implement a federated log-in eg. through Twitter using Omniauth.
- Implement AJAX for updating 'digging' a Snapshot! without page reload.

## Challenge Brief from Makers Academy
===================================

### Instagram Challenge
-----------------------

Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your challenge solution by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. It will need to look like the instagrams website or better. 

Breakdown of models:
- User
- Post
- Comment/description
- Like
- Further styling

