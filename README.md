Instagram Challenge
===================

Getting Started
``ruby
git clone git@github.com:jongmin141215/instagram-challenge.git
cd instagram-challenge
bundle install
bin/rake db:create
bin/rake db:migrate
rails s
``
visit http://localhost:3000

Features
-----
* Users can post pictures, leave comments, and like pictures.
* Users can sign up/ sign in using Devise.

Still to do
------
* Add Omniauth login
* Unlike pictures
* Add Ajax
* Upload pictures on Amazon S3
* More styling
