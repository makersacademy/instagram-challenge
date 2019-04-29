![Build status](https://travis-ci.org/micosmin/instaclone.svg?branch=master)
![Coverage](https://github.com/micosmin/instaclone/blob/development/badge.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/33b079577460f3ad758b/maintainability)](https://codeclimate.com/github/micosmin/instaclone/maintainability)

Version 1.2 - https://lit-river-61164.herokuapp.com/

Pictures won't persist beyond the runtime of the Heroku dyno, as S3 not implemented yet.

# README

Trello board link: https://trello.com/b/BhHxImVc/instragram

## Description

Instagram clone built using Ruby on Rails
Users can perform CRUD operations on their pictures
Users can comment on other pictures
Users can sign-up and log in to enable posting and commenting functionality

## Technologies used

Ruby version: 2.5.0
Rails
Rspec
Javascript

**Local development**

```
git clone https://github.com/micosmin/instaclone.git

bundle install

bundle update

rails db:create

rails db:migrate

travis setup heroku if you want to deploy it there
```

**Heroku setup**  
Create a heroku account go create one here: heroku.com

Install heroku cli:

`brew install heroku`

Once you have an account, run this command in terminal

`heroku login`

Now you can create a heroku app from terminal, deploy and move app from staging to production

Create a heroku app

`heroku create -remote heroku_app_name`

Push application to heroku app

`git push heroku_app_name master`

**Heroku pipeline**

Check this website for setting up a pipeline in heroku
https://devcenter.heroku.com/articles/pipelines

Things to do once the pipeline is set:

- update travis.yml file of your local development and master branches to point to the specific Heroku apps you have set up in the pipeline

Moving apps from staging to production:

- you can move apps through the pipeline by running this command

`heroku pipelines:promote -r staging`

**How to run the test suite**

`rspec`

## To use the app

Run `rails server`
Go to `http://localhost:3000/`

**Contribute**

1. Fork it ( https://github.com/micosmin/instaclone.git )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
