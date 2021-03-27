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
