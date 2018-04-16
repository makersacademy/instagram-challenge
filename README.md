# Trollstagram

A place where you can be yourself.

## Technologies used
- Back-end
  - [Ruby on Rails](http://rubyonrails.org/)
  - [Devise](https://github.com/plataformatec/devise)
  - [Paperclip](https://github.com/thoughtbot/paperclip)
- Front-end
  - HTML
  - [Bootstrap](https://getbootstrap.com/)
- Testing
  - [RSpec](http://rspec.info/)
  - [Capybara](https://github.com/teamcapybara/capybara)
  - [Selenium WebDriver](https://www.seleniumhq.org/projects/webdriver/)

## Getting started
Follow the instructions below to download a copy of the project and run it locally for testing and development purposes.

### Prerequisites
- Verify that a current version of Ruby is installed:
```
ruby -v
```
- Verify that PostgreSQL database is correctly installed on your local machine:
```
psql --version
```
- Verify that a current version of Rails is installed:
```
rails --version
```

### Installing
Follow the instructions below to get both a test and a development environment running
```
git clone https://github.com/antcin/instagram-challenge.git
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails server # Start the server at localhost:3000
```
In a web browser, visit `localhost:3000` and register to Trollstagram to start posting.

### Testing
```
rspec # Run the tests to ensure it works
```

### Reflections
My main goal for this weekend was to reinforce my understanding of Rails. Throughout the week, I realised that some Ruby/Rails concepts were still a bit daunting (e.g.), therefore I used this challenge as a practice ground. I began working on the challenge on Friday night. The first thing I decided to implement was posts (with image and caption). After a bit of research, I decided to use [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) to upload files. After having set that up, I got quite carried away by researching the different ways to store images on cloud. I even managed to setup a connection to Google Cloud Storage. However, I didn't feel like I was developing the app following a test-driven approach, therefore I decided to wipe everything off and start again using paperclip. I followed [Devwalks' tutorial](https://www.devwalks.com/lets-build-instagram-test-driven-with-ruby-on-rails-part-1/), which - compared to other tutorials - does not always give out the solution, and makes you think through and build the feature yourself. This tutorial really helpful as it made me feel more comfortable and aware of what I was doing.
I managed to implement the main features for posts (CRUD), along with some user authentication features.

Had I stuck to my first approach using Carrierwave (and lots of scaffolding), I would have probably managed to implement more functionalities as the development would have been quicker. Nevertheless, I believe that the TDD approach - despite being more time consuming - significantly improved my understanding of Rails.

**NB: the design is currently the same used by Devwalks**

### To do
- Complete user features
- Implement comments
- Implement likes
- Improve design
