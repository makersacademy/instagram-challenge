J-Instagram
===================

![Imgur](http://i.imgur.com/oDehFA6.png)

Introduction :camera:
------------------
J-Instagram is a little Instagram clone that provides a platform for users to post and comment on photos.

Features :star2:
--------------
* Post a photo with a status;
* User can edit the status or delete their photo;
* User can comment on a photo;
* User can like a photo.

How to use J-Instagram :page_with_curl:
-------------------------------------
Click [here](http://j-instagram.herokuapp.com/) to explore J-Instagram online.

To install and use locally:
```
$ git clone git@github.com:junyuanxue/instagram-challenge.git
$ cd instagram-challenge
$ bundle
$ rake db:create
$ rake db:migrate
$ rails s
```
Then open your browser, visit `http://localhost:3000`.

Testing :white_check_mark:
---------
This project is test-driven with RSpec-Capybara. To run all the tests, simply run `rspec` in your terminal.

Tools used :wrench:
-----------
* Ruby on Rails
* RSpec-Capybara
* Active Record
* Devise
* Paperclip
* Shoulda
* Factory Girl
* AWS S3

Author :cat:
----------------------
Junyuan Xue

[github](https://github.com/junyuanxue)  [blog](https://spinningcodes.wordpress.com/)
