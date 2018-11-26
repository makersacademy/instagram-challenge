# instagram clone challenge
week 8 challenge at [Makers Academy](https://makers.tech/)

https://instagram-toddpla.herokuapp.com/

|technologies|testing|build|host|
|----------|:--------:|:--------:|:---------|
|![rails](https://github.com/konpa/devicon/blob/master/icons/rails/rails-plain-wordmark.svg)![bootstrap](https://github.com/konpa/devicon/blob/master/icons/bootstrap/bootstrap-plain-wordmark.svg)|and andother one|![travis](https://github.com/konpa/devicon/blob/master/icons/travis/travis-plain.svg)|![heroku](https://github.com/konpa/devicon/blob/master/icons/heroku/heroku-plain-wordmark.svg)

## setup locally

**system dependencies**  
[imagemagik](https://www.imagemagick.org/script/index.php) - on osx i recommend using `brew install imagemagick`

```sh
git clone https://github.com/toddpla/instagram-challenge
cd instagram-challenge
bin/rails db:create
bin/rails db:migrate
```
## running the test suite

```sh
rspec
```
