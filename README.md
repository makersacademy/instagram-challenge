Instagram Challenge
===================

## Ruby version
  * 2.7.2

## System dependencies
* Gems:
```
bootsnap (>= 1.4.4)
byebug
capybara (>= 3.26)
factory_bot_rails
jbuilder (~> 2.7)
listen (~> 3.3)
pg (~> 1.1)
puma (~> 5.0)
rack-mini-profiler (~> 2.0)
rails (~> 6.1.3, >= 6.1.3.1)
rspec-rails (= 4.0)
rubocop-rails
sass-rails (>= 6)
selenium-webdriver
spring
turbolinks (~> 5)
tzinfo-data
web-console (>= 4.1.0)
webdrivers
webpacker (~> 5.0)
```

* Node Modules:
```
"@rails/actioncable": "^6.0.0",
"@rails/activestorage": "^6.0.0",
"@rails/ujs": "^6.0.0",
"@rails/webpacker": "5.2.1",
"turbolinks": "^5.2.0"
"webpack-dev-server": "^3.11.2"
```

* Configuration

## Database setup:

* Database creation
```shell
rake db:create
```

* Database initialization
```shell
rake db:migrate
```

## How to run the test suite

```shell
bundle exec rspec
```

or:
```shell
bundle exec rake
```

for documentation format:
```shell
bundle exec rspec -fd
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## User stories

### Complete
```
As a user,
I would like to see posts on the home page,
So I can easily see my network's posts.

As a user,
I want to be able to post photos,
So that I can share my best images

As a user,
I want to caption my posts,
So that I can add context to an image.
```

### Pending
```
As a user,
I want the posts to appear in reverse chronological order,
So I am always seeing the latest posts first.

As a user,
I would like to be able to sign up for Instagram,
So I can build a portfolio of posts.

As a user,
I want to be able to sign in,
So that I can access my account and posts.

As a user,
I want to be able to sign out,
So that others can't access my account.

As an admin,
I want users to not see posts and be redirected to the sign up page when not logged in,
To protect the privacy of our users.

As an admin,
I want all posts to include an image or video,
So that Instagram is known for photo and video sharing.

As a user,
I want to be able to add filters to my posts,
So that I can add effects to my photos.

As a user,
I want to be able to follow other users,
So that I can keep up to date with my favourite posters.

As a user,
I want to be able to like posts,
So that I can share my appreciation for great photos.

As a user,
I want to be able to comment on posts,
So that I can share my thoughts about interesting photos.
```
