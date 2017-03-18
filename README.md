# Instagram Challenge
#### Technologies: Ruby, Javascript, Rspec, Rails, Postgres, SQL, Heroku, Facebook, AWS
### [Makers Academy](http://www.makersacademy.com) - Week 8 Solo Weekend Project

## Index
* [User Stories](#Stories)
* [Gems Used](#GEMS)
* [Installation](#Install)
* [Usage](#Usage)
* [Screen Shots](#Shots)
* [Use live on Heroku](#Heroku)

## Challenege

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

## <a name="Stories">User Stories</a>
```
As a user
So that images are connected to me
I want to be able to sign up

As a user
So that images are connected to me
I want to be able to sign in

As a user
So that images are connected to me
I want to be able to sign out

As a user
So I can have a library of images
I want to be able to upload my images

As a user
So I can illustrate mine and others images
I want to be able to comment to images

As a user
So I can let others know I like their images
I want to be able to like an image

As a user
So that I can remember my account details
I want to be able to log in via Facebook

As a user
So I can store lots of images
I want to be able to upload to Amazon Web Services
```

## <a name="GEMS">Gems Used</a>
```ruby
gem 'aws-sdk', '< 2.0'
gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'devise'
gem 'omniauth-facebook'
gem 'therubyracer'
gem 'omniauth'
gem 'omniauth-digitalocean'
gem 'paperclip', '~> 4.3', '>= 4.3.6'

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'rspec-collection_matchers'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'shoulda'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

## <a name="Install">Installation</a>
* To clone the repo
```shell
$ git clone https://github.com/adrianeyre/instagram-challenge
$ cd instagram-challenge
$ bundle
$ rake db:create
$ rake db:migrate
```
* Update your Facebook Security Key and AWS details
Creata a file called `.env` in the root and fille in the below details
```
FACEBOOK_APP_SECRET=
S3_BUCKET_NAME=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
```

## <a name="Usage">Usage</a>
To load Rails web server
```shell
$ bin/rails server
```
type `http://localhost:3000` into your web browser

## <a name="Shots">Screen Shots</a>
### Main Page
[![Screenshot](https://raw.githubusercontent.com/adrianeyre/instagram-challenge/master/images/screenshot1.png)](https://raw.githubusercontent.com/adrianeyre/instagram-challenge/master/images/screenshot1.png "Screen Shot 1")

### Sign up
[![Screenshot](https://raw.githubusercontent.com/adrianeyre/instagram-challenge/master/images/screenshot2.png)](https://raw.githubusercontent.com/adrianeyre/instagram-challenge/master/images/screenshot2.png "Screen Shot 2")

### Sign in
[![Screenshot](https://raw.githubusercontent.com/adrianeyre/instagram-challenge/master/images/screenshot3.png)](https://raw.githubusercontent.com/adrianeyre/instagram-challenge/master/images/screenshot3.png "Screen Shot 3")

## <a name="Heroku">Live on Heroku</a>

[![heroku-48](https://raw.githubusercontent.com/adrianeyre/codewars/master/Ruby/Authored/heroku.png)](https://adrianeyre-instagram.herokuapp.com) [Use on Heroku](https://adrianeyre-instagram.herokuapp.com)
