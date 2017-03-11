## Instaram Challenge
#### Technologies: Ruby, Rails, Javascript, PostgreSQL, Rspec, Omniauth Facebook, Amazon S3
### Week 8 solo weekend challenge for [Makers Academy] (http://www.makersacademy.com)
[Outline](#outline) | [Screenshots](#screenshots) | [User Stories](#user-stories) | [Gems](#gems) | [Usage Instructions](#usage-instructions) | [Heroku](https://samsinstaclone.herokuapp.com/)

## Brief
Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

## Outline
The final Makers Academy solo weekend challenge was to build a light-weight clone of Instagram on Rails.  The main challenge I faced in building this app was working out how to test for image uploads using Capybara.  As well as implementing user authentication using the [devise](https://github.com/plataformatec/devise) and [OmniAuth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview) gems, I alos learned how to host data using Amazon Web Services in order to allow for larger number numbers of images being uploaded.

## Screenshots
#### Log In Screen
![Log In Screen](/app/assets/images/login.png?raw=true "Log In Screen")
#### Gallery Screen
![Gallery Screen](/app/assets/images/gallery.png?raw=true "Gallery Screen")
#### Photo View
![Photo View](/app/assets/images/main.png?raw=true "Photo View")

## User Stories
```
As a user
So that I can use PhotoShack
I want to be able to sign up and sign in

As a user
So that I can share my photos
I want to upload a photo to PhotoShack

As a user
So that I can enjoy photos taken by others
I want to be able to see other's photos

As a user
So I can share my appreciation
I want to be able to comment on other's photos

As a user
So I can share my appreciation
I want to be able to like other's photos

As a user
So that I can log in easilly
I want to be able to log in via Facebook

As a website owner
So that my site can store lots of images
I want to be make use of Amazon Web Services
```

## Gems
```ruby
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
gem 'shoulda', '~> 3.5'
gem 'paperclip', '~> 4.3', '>= 4.3.6'
gem 'aws-sdk', '< 2.0'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'rspec-collection_matchers'
  gem 'poltergeist'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

## Usage instructions
* clone the repo and set up databases
```shell
$ git clone https://github.com/samjones1001/instagram-challenge
$ cd instagram-challenge
$ bundle
$ rake db:create
$ rake db:migrate
```

* to allow for facebook login and remote image hosting
Set the following ENV variables
```
FACEBOOK_APP_SECRET=
S3_BUCKET_NAME=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
```

* load Rails web server
```shell
$ bin/rails server
```
Open your broweser, and navigate to `localhost:3000`
