[![Build Status](https://travis-ci.org/y0m0/instagram-challenge.svg?branch=master)](https://travis-ci.org/y0m0/instagram-challenge)
[![CodeClimate](https://codeclimate.com/github/y0m0/instagram-challenge/badges/gpa.svg)](https://codeclimate.com/github/y0m0/instagram-challenge)
[![Test Coverage](https://codeclimate.com/github/y0m0/instagram-challenge/badges/coverage.svg)](https://codeclimate.com/github/y0m0/instagram-challenge/coverage)

Imāgo
===================

Imāgo, which translate to picture in latin, is the result of my take on the [Instagram-challenge](https://github.com/makersacademy/instagram-challenge).  
Imāgo is also available on [Heroku](https://production-imago.herokuapp.com/)

```

  ▄██████████████████████████▄
▄█▀ █ █ █                    ▀█▄
█   █ █ █              █████   █
█   █ █ █              █████   █
█   █ █ █              █████   █
█         ▄▄▄█████▄▄▄          █
███████████▀▀     ▀▀████████████
█       ██  ▄█████▄  ██        █
█       ██ ██▀   ▀██ ██        █
█       ██ ██▄   ▄██ ██        █
█       ██▄ ▀█████▀ ▄██        █
█        ▀██▄▄   ▄▄██▀         █
█          ▀▀█████▀▀           █
▀█▄                          ▄█▀  
  ▀██████████████████████████▀
```


### Getting Started

Clone this repository

Install all the required dependecies with:  
```bundle install```  

Initialize the db with:

```sh
$ rake db:create
$ rake db:migrate
```

Start the app:
```sh
$ rails s
$ open http://localhost:3000
```

To run the tests:
```sh
rspec
```

### Next steps
Unfortunately the time was limited and I didn't manage to push all the features that I wanted, but given time I was planning to:
- Connect the db to an Amazon EC2 instance so that the pictures can survive Heroku dynos resets
- Finish the Like button functionality
- Hash tags
- Add the possibility to add filters when posting new pictures

### Stack
- Rails
- Ruby
- Postgres
- Carrierwave (upload pictures)
- Clearance (handle user auth)

### Testing
- FactoryGirl
- RSpec
- Capybara
- Simplecov

### CI
- Travis-ci
- Codeclimate
