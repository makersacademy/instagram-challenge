# Instagram Challenge
---
<p align="center">
  <img src="./public/images/instagram.png"/>
</p>



### About
An Instagram clone where a user can post pictures which can be commented and liked by other users.

---
### Visit the site on Heroku


### Or run locally

Clone the repo. Then:

```
$ bundle install
$ bin/rails db:create
$ bin/rails db:migrate
```

### To run the tests

```
bash bundle exec rspec
```

### To connect the photo hosting service on AWS S3
* install imagemagick (for Mac run `brew install imagemagick` for Windows use the [binary release](http://www.imagemagick.org/script/binary-releases.php#windows)
* create .env file in your project root
* populate the following variables with your own S3 credentials:

```
BUCKET_NAME=<your_bucket_name>
ACCESS_KEY_ID=<your_access_key_id>
SECRET_ACCESS_KEY=<your_secret_access_key>
AWS_REGION=<your_aws_region>
```

### To view in browser
```
$ bin/rails server
```
This will start the server at localhost:3000

---
### Technologies used
* [Ruby](https://www.ruby-lang.org/en/) as the main back-end language
* [Rails](http://rubyonrails.org/) for the framework
* [Travis CI](https://travis-ci.org/)
* [PostgreSQL](https://www.postgresql.org/) for handling databases
* [GitHub](https://github.com/makersacademy/acebook-remote-july-2017) for storing our work
* [AWS S3](https://aws.amazon.com/) for photo storage
* [Heroku](https://acebook-remote-july.herokuapp.com/
) for hosting the website
* [RuboCop](https://github.com/bbatsov/rubocop) for linting
* CSS to make it look pretty
* Git for version managing

### Author
Costas Kiteou, _Makers Student_  - **Remote Cohort July 2017**
