![Travis](https://travis-ci.org/micosmin/instaclone.svg?branch=master)

# README

Trello board link: https://trello.com/b/BhHxImVc/instragram

Ruby version: 2.5.0

System dependencies

**Local development**

```
git clone https://github.com/micosmin/instaclone.git

bundle install

bundle update

rake db:create

travis setup heroku
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

**Heroku pipelin**

Check this website for setting up a pipeline in heroku
https://devcenter.heroku.com/articles/pipelines

Things to do once the pipeline is set:

- update travis.yml file of your local development and master branches to point to the specific Heroku apps you have set up in the pipeline

Moving apps from staging to production:

- you can move apps through the pipeline by running this command

`heroku pipelines:promote -r staging`

**Database creation**

`rake db:create`

**Database initialization**

`rake db:migrate`

**How to run the test suite**

`rspec`

- Services (job queues, cache servers, search engines, etc.)

**Deployment instructions**
