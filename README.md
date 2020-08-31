# Instagram Clone

## Deployed at https://tranquil-reef-21707.herokuapp.com/

[![Build Status](https://travis-ci.com/harrylb14/instagram-challenge.svg?branch=master)](https://travis-ci.com/harrylb14/instagram-challenge)

<img src="public/Screenshot 2020-08-31 at 15.46.38.png">
<img src="public/feed view.png">
<img src="public/post view.png">

- Sign up/log in, create posts, post pictures, comment on posts! 
- Socialise without fear of data stealing. 

- Created using Rails, Devise, Bootstrap.

- Test coverage: 98.51%

### To run locally: 

```
Bundle install
rails db:setup
rails db:create
rails db:migrate
rails db:migrate RAILS_ENV=test
bundle exec rake
```
To run tests: 
```
rspec
```
To run site: 
```
rails s
```
Or visit the heroku link to view the site. 
