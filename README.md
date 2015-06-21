Instagram Challenge
===================

Task
-----

Build Instagram:

"Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!"

User stories:

```
As a keen photographer
So that other people can see my stuff
I want to be able to post my pictures on the internet

As a website visitor
So that I know who posted what
I want to be shown the user that uploaded an individual photo

As a person who likes to show their appreciation for good photography
So that I can register my approval for a photo
I want a 'like' button for each photo

As a person who likes to discuss photography
So that I can enter into a dialogue with other users of the site
I want to be able to leave a comment for each photo
```

Technologies Used:
-------

* Ruby On Rails (full-stack web app framework)
* RSpec/Capybara(full testing suite for RoR applications testing the front and back end)



Steps taken/to take:
-------

* First step is to create the photos and list them on the page. I will be doing this without images first. It's not unreasonable to expect a photo will need a caption (although not directly specified in the brief, or within my user stories) but it is a handy placeholder for me to then bolt on a photo upload later
* Once this is going I will add the ability to upload photos by associating them with the new photos model. The challenge will be working out how to test for that
* With a simple photo uploader going well, this will be the time to deal with users - logging in, displaying their username with each photo etc. (NB for the first four user stories, the basic functionality spec provided in the challenge, any associatons re: deleting etc can be added later
* Add a like (endorsement) button
* Add a comments box

Further steps for the future:
-------
* restrict deletion to the user that uploaded
* image resizing on upload
* add AJAX to make the magic happen all in one place

Links:
-------

Challenge issued here: [Github - Makers Academy: Instagram Challenge](https://github.com/makersacademy/instagram-challenge)