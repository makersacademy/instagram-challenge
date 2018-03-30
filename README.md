# README

### Solo Challenge: Having learned Ruby on Rails in 5 days, build an Instagram-style full-stack website in 1 day.

<img src="Instawham_Gif.gif" width="100%" height="100%" />

# Steps to run the program
* In the terminal:
  * 'bundle install': to use bundler to install all gem dependencies
  * rails db:migrate
  * 'rails server' to start the server
  * In your browser, visit localhost:3000

# Other information on using the program

* Ruby version: 2.5.0

* User authentication uses the 'devise' gem

* How to run the test suite
  * In the terminal: 'rspec'


  Marcus' README Edits - My approach and mini code review
  =================

  My approach
  ---------
  * My priorities for learning were:
    * Nested data relationships
    * User authentication
    * Consolidating learning for using rails
  * I only had one day to attempt the challenge, so the first thing I did was carefully plan my approach to the challenge, including:
    * Mapping out the different elements at play
    * Deciding what an MVP-1 and MVP-2 would look like by breaking down tasks into user stories and prioritising based on what I most wanted to learn
    * I mapped out the high-level steps I wanted to take to get to MVP
    * I mapped out what the program would look like from a user perspective
    * I mapped out the different data relationships across the resources
  * The previous week was a similar rails challenge, which I built with a team without using scaffolds. Given the time constraints and because I wanted to learn the impact of using scaffolds and their use in practice, I used scaffolds for the picture and comment resources (including researching a particular nested scaffold gem to test this out in defining nested relationships quickly)
  * For the pictures resource, I relied upon adjusting the automated scaffold tests. For the users and comments resources, I used TDD by first creating a set of feature tests, and then writing code to satisfy these. The only situation in which I didn't apply TDD was the comment edit and delete functions, where I created the test after the functionality (because the scaffold came with relevant tests initially, which I later realised wouldn't be sufficient)
  * Where I found the logic becoming more complex, I would further break out the next steps I had to do and take them on one by one
  * I did not prioritise formatting of pages


  My appraisal of my attempt at the weekend challenge
  ---------
  * I was pleased with my approach to the exercise, particularly the way I clearly prioritised learning outcomes and how this shaped what I coded and therefore what I learned
  * I was particularly pleased that I rapidly got user authentication working, including only allowing users to edit and delete pictures of comments they had made, both from a view and controller perspective
  * Due to my in-depth methodical learning process of rails at Makers Academy, I felt comfortable quickly setting up and getting the app working, allowing me to move onto new topics quickly. I felt this was a good base of knowledge to build upon which made the challenge easier
  * There are still a large set of features it would be great to continue building out (detailed below)
  * I used TDD for core functionality, but testing is the area I feel particularly needs more development (see things I would have done if I had more time)
  * I found using scaffolds quite an interesting pursuit. One learning was that testing is an area where it is particularly difficult to get around good, methodical code. E.g. using rails scaffolds tests become quickly useless when its a nested resource or there are other layers such as user authentication
  * I believe I did a good job of 'researching before I jumped'. Doing due diligence and research for the different approaches I could take before going e.g. I researched using the CarrierWave gem to upload image files, before deciding URLs were the way to go based on my learning priorities


  Outstanding questions from the exercise:
  ---------
  * By creating a rails project in the repo, it created Git submodules. How do these work in practice / should I have somehow structured it differently to avoid git submodules. I forced the addition of files and removal of the submodule as it was clear this wasn't pushing correctly and I didn't have time to research how to effectively use submodules. I lost my commit history as a result.
  * How do the in-built rails tests work for rendering forms etc/ are these tests things that I should aim to have for my applications, or are they over kill?
  * I know I can improve my tests and test coverage - what should be the next step priorities for testing beyond the ones I have?
  * How do you write a test to check an image has been loaded in and shown?
  * How secure is my application (any obvious ways of subverting the user authentication I created?)
  * Discuss use of scaffolds
  * What other core rails features exist beyond the ones I have used (scaffolds/ generations/ path helpers)
  * What other very useful rails gems are there like devise?


  Things I would have liked to develop if I had more time:
  ---------
  * There are a lot more unit and feature tests I would like to write to cover all edge cases, particularly the interaction of user authentication and conducting CRUD actions
  * The program is missing one feature from the spec: the ability to like comments and/or pictures
  * I would like to use a gem for the upload of picture files rather than relying on web URLs (e.g. using CarrierWave)
  * Reviewing and refactoring the codebase
  * I would like to format the web pages a lot better




  Instagram Challenge
  ===================

  ## Instructions

  * Challenge time: one weekend
  * Feel free to use Google, your notes, books, etc., but work on your own
  * If you refer to the solution of another coach or student, please put a link to that in your README
  * If you have a partial solution, **still check in a partial solution**
  * You must submit a pull request to this repo with your code by 9am Monday morning

  ## Task

  Build Instagram: Simple huh!

  Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

  Bonus if you can add filters!

  ## How to start

  1. Produce some stories, break them down into tasks, and estimate
  2. Fork this repo, clone, etc
  3. Initialize a new rails project

  Remember to proceed in small steps! Getting confused? Make the steps even smaller.

  ## Code Quality

  For linting, you can use the `.rubocop.yml` in this repository (or your own!).
  You'll need these gems:

  ```ruby
  gem "rubocop", "0.48.1"
  gem "rubocop-rails"
  ```

  You can also lint Javascript, CSS, and ERB — feel free to research this. These
  will help you to train yourself to produce cleaner code — and will often alert
  you to mistakes or mishaps!
