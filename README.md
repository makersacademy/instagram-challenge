# Instagram Clone

I have created an Instagram Clone, which is a popular web application that allows users to create, comment on and like photos. This clone was built using the Ruby on Rails framework.

## How to Use the App

- In the terminal, ```git clone https://github.com/DarkChocLatte/instagram-challenge```.

- In the terminal, cd into ```instagram_clone```.

- Run ```bundle install``` on your terminal if you already have bundle installed. Otherwise run ```gem install bundle``` prior.

- In the terminal, create your databases by running the ```bin/rake db:create``` command.

- In the terminal, migrate your databases by running the ```bin/rake db:migrate``` command.

- In the terminal, run the rails server by running the ```bin/rails s``` command.

- Navigate to http://localhost:3000/ in the browser

## How to Run the Test Suite

- Run ```rspec``` within the terminal

## Technologies Used

- App uses        - Ruby on Rails framework.

- devise          - used to create our user model with a lot of in built functionality.

- bootstrap-sass  - used to help speed up page styling with built in customisable templates.

- simple_form     - used to help speed up the creation of forms.

- paperclip gem   - used to allow image upload functionality on the app.

- masonry-rails   - used to create page transitions on the app.

- acts_as_votable - used to allow user voting functionality.

## Challenges

- Feature testing images with capybara
