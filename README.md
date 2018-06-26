# Instagram Challenge

This is my version of the Instagram weekend challenge; completed at the end of week 8 of the Makers course. The task was to build a clone of Instagram using Rails in two days. The clone needed to have **users** who can post **pictures**, write **comments** and **like** a picture.


## Getting Started

To get started, clone a copy of this repository using:

```ruby
git clone https://github.com/andyk144/instagram-challenge.git
```

### Installing

Once you have cloned the repository, navigate to it using

```ruby
cd instagram-challenge
```

Then run
```ruby
bundle install
```
This will install all of the necessary Ruby Gem's required to run the program.

### Usage

To run the application using your local server, enter the following commmand in the terminal (ensure you are in the root folder of the directory):

```ruby
rails s
```

This will start the rails server

![Alt test](/app/assets/images/rails_server_sshot.png?raw=true "Rails Server")

Navigate to http://localhost:3000 (or whichever port your server is running on) and the app will be up and running.

## Running the tests

To run the tests, whilst in the root folder of your application, enter the command ```rspec```


## Built With

* [Ruby on Rails](http://rubyonrails.org/) - The web-application framework used
* [Paperclip](https://github.com/thoughtbot/paperclip/) - File attachment management Ruby Gem
* [Bootstrap](https://getbootstrap.com/) - Front end component library
* [Simple Form](https://github.com/plataformatec/simple_form) - Form library for Ruby on Rails
* [Acts as Voteable](https://github.com/ryanto/acts_as_votable) - Ruby Gem to assist with liking and unliking posts


## Screenshots

Registration page

![Alt test](/app/assets/images/register_page.jpeg?raw=true "Registration Page")

Main feed page

![Alt test](/app/assets/images/feed_page.jpeg?raw=true "Main feed page")
