![Travis](https://travis-ci.org/micosmin/instaclone.svg?branch=master)

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version: 2.5.0

- System dependencies

- Configuration

  bundle install
  bundle update
  rake db:create
  run travis setup Heroku

  - update development staging and master branches to point to the specific Heroku apps form the pipeline

  - you can move apps through the pipeline by running this command

  `heroku pipelines:promote -r heroku`-> will move app to staging (name heroku was given as a defalt - name can be provided at setup by running `heroku create -remote name`)
  `heroku pipelines:promote -r staging` -> will move app to production

  - alternatively you can merge the development branch with the staging branch and push the update. this will update the staging app

* Database creation

`rake db:create`

- Database initialization

`rake db:migrate`

- How to run the test suite

`rspec`

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions
