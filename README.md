Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!


## Getting started

- `git clone https://github.com/shezdev/painLess.git`
- `cd /painLess`
- `gem install rails`
- `brew install postgresql` (extra configuration may be needed to install the database user on your computer)
- `bundle install` in the root directory
- `bin/rake db:create` to create the databases:'painless_development' and 'painless_test'
- `bin/rake db:migrate` to run the database migrations


## Usage
- Run `bin/rails server` to run the Puma web server
- Visit `http://localhost:3000` to view the app in your browser
- Click on Register and follow the wizard

## Running tests
- Run `rspec` from the `/painLess` directory
- Currently shows `26 examples, 0 failures`

## Technology Stack
* Built using **[Ruby on Rails](http://rubyonrails.org/)**
* Uses a **[Puma Web Server](http://puma.io/)**
* Runs off a **[Postgres Database](https://www.postgresql.org/)**
* Tested using **[RSpec](http://rspec.info/)**, **[Capybara](http://teamcapybara.github.io/capybara/)** and **[Cucumber](https://cucumber.io/)**
* Test coverage statistics calculated using **[Coveralls](https://coveralls.io/)** and **[Travis CI](https://travis-ci.org/shezdev/painLess)**
* Front-end design uses **JavaScript** and **CSS**
* Trigger food pie chart and exert to pain line graph created using **[Chart.js](http://www.chartjs.org/)**
* PDF functionality to view all activity created using **[Wicked PDF](https://github.com/mileszs/wicked_pdf)**
