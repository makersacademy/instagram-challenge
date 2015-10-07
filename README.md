[![Build Status](https://travis-ci.org/katylouise/instagram-challenge.svg?branch=master)](https://travis-ci.org/katylouise/instagram-challenge.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/katylouise/instagram-challenge/badges/gpa.svg)](https://codeclimate.com/github/katylouise/instagram-challenge)

Bextagram
==========
A picture sharing app built in order to practise using Ruby on Rails and ActiveRecord.  In particular, this project helped me to gain a better understanding of associations in ActiveRecord.

Getting Started
---------------
```
git clone https://github.com/katylouise/instagram-challenge
cd instagram-challenge
bundle install
bin/rake db:create
bin/rake db:migrate
rails s
```
Go to localhost:3000

v1.0
-----
* Users can upload pictures, write comments and like pictures.
* Users can sign in/up using Devise.
* All pictures can be viewed in reverse chronological order.
* Simple styling.


Still to do/ Wish list
-----------------------
* Users can only like each picture once.
* Fix pluralize on likes.
* Picture reload (maybe using AJAX) at the bottom.
* Add Omniauth Login.
* Unlike feature.
* Comments form displayed in line.
* Bonus if you can add filters!