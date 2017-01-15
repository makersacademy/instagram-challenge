# Punstagram Challenge

Instagram: but with puns! A picture uploading app with options for commenting and signing up/siging in (even via Facebook as well).

## How to use the app

* In the terminal, git clone https://github.com/Unicornelia/instagram-challenge.
* In the terminal, cd instagram-challenge.
* In the terminal, create your databases by running the bin/rake db:create command.
* In the terminal, migrate your databases by running the bin/rake db:migrate command.

If you would like to have functionality that allows a user to sign in using facebook, please create a 'config/env.yml' file and navigate to 'https://developers.facebook.com/' and log in. After creating a facebook login product add your API key values to the 'env.yml' file being sure to name the key the same as displayed in the 'config/secrets.yml' file.

* In the terminal, run the rails server by running the bin/rails s command.
* Navigate to http://localhost:3000/ in the browser.
* Enjoy using the app.

## Technologies Used
- Ruby on Rails framework
- envyable gem was used to help hide sensitive information
- devise gem was used to create the user model with a lot of in built functionality
- omniauth-facebook gem was used to allow third-party authentication with facebook
- paperclip gem for uploading pictures
- interface is created using haml and css

## Instructions for Running the Tests

* In the terminal, cd instagram-challenge.
* run rspec command

## Interface

![Interface](/images/punstagram.png)
