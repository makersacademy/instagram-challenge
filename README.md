Instagram Challenge
===================

Goal

As a human I want to post pictures and write comments on pictures and like pictures.  I also want to add filters to my pictures.


User Stories
-------

 1. As a user I want to be able to create a paswword protected account so that I can sign up, sign in, sign out. (estimate 3 hours)

 2. As a user I want to use my instagram credentials to sign in so that I can access instagram challenge using my instagram credentials. (estimate 3 hours)

 3. As a user I want to be able to upload photos to my instagram challenge account from my pc/phone. (estimate 1 hours)

 4. As a user I want only my followers to see my pictures.

 5. As a user I want only to pictures of people who I follow.

 6. As a user I want to be able to add filters to pictures so I can wow my friends. (estimate 2 hours)

 7. As a user I want my pictures to have many comments so that I see reaction to my pictures from other users. (estimate 3 hours)

 8. As a user I want my pictures to have many likes so that I can crowdsource popularity of my pictures. (estimate 2 hours)

 9. As a user I want to be able to add my instagram pictures to my 'challenge' account. (estimate 3 hours)


 Approach
 -------


Domain Model:

User has_many Followers

Follower has_many Followers

User has_many Pictures(Posts)

Pictures has_many Comments

User has_many Comments

Pictures has_many Likes

User has_many Likes


Coding Approach:

Use Rails for framework

gem devise and instagram

gem paperclip

gem CSSgram for styling

gem bootstrap for styling

gem Jquery for interaction


 * Aim to do backbone of site by redoing yelp challenge
 * Then enhance one step at a time stating with social aspect.





Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
* Forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
