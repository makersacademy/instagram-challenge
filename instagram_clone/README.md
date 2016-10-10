# Instagram Weekend Challenge

The weekend challenge of week 8 at Makers Academy is to build Instagram using Rails.

## User Stories

```
As a user  
So I can share my photos with family and friends   
I want to be able to post pictures

As a user
So I can express my thoughts on a photo
I want to be able to write comments on pictures  

As a user   
So I can express my liking of a photo  
I want to be able to like a picture  

As a user  
So I can look up a photo quickly  
I want to be able to filter photos according to a category and/or date  
```

## Installation

```sh
$ git clone https://github.com/littlethao/instagram-challenge.git
$ cd instagram-challenge/instagram_clone
$ rake db:setup
$ rspec
```

To run app:

```sh
$ rake db:migrate
$ rails s
```

**You should now be able to access the app in your browser at [localhost:3000](http://localhost:3000)**!

```
![Screenshot]([Imgur](http://i.imgur.com/c7kjEZ3.png)
```

## Technologies

* Ruby version

* Rails version 5.0.0

* Gem Devise for user functionalities

* Gem Paperclip and ImageMagick for picture upload management

* Test suite with RSpec-rails, Capybara and gem Shoulda

* PostgreSQL for database set up

* Services (job queues, cache servers, search engines, etc.)
