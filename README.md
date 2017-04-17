Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters! 

Technologies used 
-----

Ruby On Rails (full stack, Web application framework)
Tested using RSpec (provides a behaviour driven development framework for the language, allowing to write application scenarios and test them.)
Shoulda (Ruby gem for testing)
Devise (Ruby gem which handles building a user model, routes for your users controller)
Poltergeist (headless browser for Capybara based on PhantomJS (scripted, headless browser used for automating web page interaction; provides a JavaScript API enabling automated navigation, screenshots, user behavior and assertions making it a common tool used to run browser-based unit tests in a headless system like a continuous integration environment))

To do:
-----

Add in 'Likes' functionality with corresponding tests. Check pluralize method is working (in both localhost and testing environment)

Correct Rspec/Capybara tests to validate image on screen

Attribute users to comments and likes

Add image to photo's profile page

Tests to cover all facets of authentication as per app/controllers/photos_controller.rb and app/controllers/comments_controller.rb


=======
Bonus if you can add filters!

