# Instagram Clone

I have created an Instagram Clone, which is a popular web application that allows users to create, comment on and like photos. This clone was built using the Ruby on Rails framework.

## How to Use the App

1. In the terminal, ```git clone https://github.com/DarkChocLatte/instagram-challenge```.

2. In the terminal, cd into ```instagram_clone```.

3. Run ```bundle install``` on your terminal if you already have bundle installed. Otherwise run ```gem install bundle``` prior.

4. In the terminal, create your databases by running the ```bin/rake db:create``` command.

5. In the terminal, migrate your databases by running the ```bin/rake db:migrate``` command.

6. Download and install image magick on your system following the instructions at http://www.imagemagick.org/script/index.php. Find out where the utility is installed using the ```/usr/local/bin/convert``` command. More detailed instructions are available at https://github.com/thoughtbot/paperclip.

    * Be sure to integrate with your environment - preferably through the PATH variable, or by changing your config/environments/development.rb

7. In the terminal, run the rails server by running the ```bin/rails s``` command.

8. Navigate to http://localhost:3000/ in the browser

## How to Run the Test Suite

- Run ```rspec``` within the terminal

## Technologies Used

- App uses            - Ruby on Rails framework.

- devise gem          - used to create our user model with a lot of in built functionality.

- bootstrap-sass gem  - used to help speed up page styling with built in customisable templates.

- simple_form gem     - used to help speed up the creation of forms.

- paperclip gem       - used to allow image upload functionality on the app.

- masonry-rails gem   - used to create page transitions on the app.

- acts_as_votable gem - used to allow user voting functionality.

## Challenges

- Feature testing images with capybara
