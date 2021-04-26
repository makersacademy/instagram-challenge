# Instagram Challenge

Due to timing, I only have the Sunday to complete this challenge, so going to see what I can get done.

My intention is to build this app via TDD using Ruby On Rails. If there is time, I would like to test implementing a front end framework like Bootstrap or React.

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

1. Users can post pictures
2. Users can add a descriptions to the pictures
3. Write comments on pictures
4. Like the pictures
5. Sign up, login/logout functionality.


#### Setup:
- Setup rails in the instagram challenge folder, note you need to run it in the directory above, so it doesn't set up an additional folder.
- Added Rspec-rails for testing
- Added rubocop - needed to update file to work with Ruby 3.0.1
- Added erb-lint for linting erb files, required adapting yml file
- added simplecov for test coverage - will need to check it works properly, may need to configure further later.

#### Development Notes

- Will implement basic posting feature with images
  - implemented basic text posting with error catcher - DONE
  - implement photo posting with the gram, and an error catcher if no photo uploaded - DONE

- will implement a user feature
  - implemented sign-in and sign-out features - Done
  - implemented sign-up feature - done
  - implemented User_id and username on gram - Done

- Likes feature
  - implemented a basic likes feature

#### TO DO
  - Feel I should be using an update route not a get route
  - need to look into a seperate database feature for likes so can link to users and only allow one like

- comments feature
  - implement

- Nav Bar

- css
  - look at sass
  - look at bootstrap (mobile styling)
  - look at react

- heroku
  - test hosting
  - test CI

- testing
  - Need to look into using doubles....
