# Instagram Challenge

![Build Status](https://travis-ci.org/ruthmoog/instagram-challenge.svg?branch=master)

This web app is a photo sharing site, where users can post pictures, write comments on pictures, and like pictures.

## Installation

In the command line use `bundle install` to download the gems needed to run the app:

```shell
$ bundle install
```

## Run the app

Launch the server from the command line, then direct your browser to `localhost:3000` to use the app.

- UNIX:
```shell
$ rails server
```
- Windows:
```shell
$ ruby bin/rails server
```

## Run the tests

### Unit Tests, Feature Tests, and Code Coverage

In the command line use `rspec` then direct your browser to the given URL or `open` from the command line:


```shell
$ rspec
$ open PATH/coverage/index.html
```

>```shell
>X examples found.
>
>
>Finished in 0.00027 seconds (files took 0.15576 seconds to load)
>X examples, X failures
>
>Coverage report generated for RSpec to /--/coverage/index.html. 0 / 21 LOC (0.0%) covered.
>```

### Code Style

In the command line use `rubocop`:

```shell
$ rubocop
```
>```shell
>Inspecting XX files
>........................................
>
>XX files inspected, no offenses detected
>```

### Code Quality

In the command line use `ruby critic` then direct your browser to the given URL:

```shell
$ rubycritic
$ open PATH/overview.html
```
>```shell
>running flay smells
>
>running flog smells
>..............................
>running reek smells
>..............................
>running complexity
>..............................
>running attributes
>..............................
>running churn
>..............................
>New critique at file:---/overview.html
>Score: 100.0
>```

## Tech Stack

- [**Puma**](https://github.com/puma/puma) - a concurrent HTTP server that comes default with Rails
- [**Rails** 5.2.3](https://rubyonrails.org/) - a server-side web application framework
- [**RAKE** 12.3.2](https://github.com/ruby/rake) - a task and dependency manager for Ruby
- [**RSpec Rails**](https://github.com/rspec/rspec-rails) - a DSL for testing Ruby on Rails
- [**Rubocop Rails**](https://rubocop.readthedocs.io/en/stable/) - a static code analyzer and code formatter
- [**Ruby** 6.2.3](https://www.ruby-lang.org/en/) - a dynamic, object oriented programming language
- [**RubyCritic** 4.1.0](https://github.com/whitesmith/rubycritic) - a code quality analysis tool for Ruby
- [**ScaffoLint**](https://github.com/makersacademy/scaffolint) - a starting point for customising the Rubocop linter
- [**SimpleCov** 0.17.0](https://github.com/colszowka/simplecov) - a code coverage analysis tool for Ruby
- [**SQLite** 3](https://www.sqlite.org/index.html) - a C-language library that implements a SQL database engine
- [**Travis CI** 1.8.10](https://travis-ci.org/) - a continuous integration platform and deployment manager

<!-- Potential Tech Stack tbc... -->
<!-- - [Heroku](https://www.heroku.com/) - a cloud platform service -->


## Approach

Kanban on [Trello](https://trello.com/b/f21BvAJa/instagram-challenge)

## Diagrams

![Domain sequence chart](https://trello-attachments.s3.amazonaws.com/5d32e72429e832554cf3c83d/5d32e8d69b729414ded01254/e5a2d409d103cd627fa83ae4e7d29420/Screenshot_2019-07-20_at_14.56.14.png)
![Domain model diagram](https://trello-attachments.s3.amazonaws.com/5d32e8d69b729414ded01254/674x966/ecb578fcfc87f5d792931835d3cc0b06/Screenshot_2019-07-20_at_15.09.08.png)
