Instagram Challenge
===================
This is the solo weekend challenge at the end of week 8 of the Makers coding bootcamp. 
Build Instagram on Rails!

By the weekend of week 8, I had precisely 4 days experience of using Ruby on Rails.

By the end of week 8 all Makers developers can:
- use high-quality processes to build a project in a team

Testing
----
Rspec-Rails, Capybara, SimpleCov with FactoryBot to handle testing with Devise
run `guard` for live (on-save) testing
To view the coverage details `open ./coverage/index.html`

Shout Outs and other tips:
------
### For correcting post set-up mishaps
1. I ran rails out of the box and didn't realise that the default was a SQLite setup. I really wanted Postgres so I could host on Heroku and for genral familiarity. This guide showed me [how to migrate from SQLite to Postgres](https://www.daveferrara1.com/ruby-in-rails-switch-from-sqlite3-to-postgres/) after I had actually started the project. Doh!

In future, set up your Rails projects with: `rails new my_app_name --database=postgresql`

### Posthumous gitignore
2. When you forget to add those irritating coverage files to your .gitignore file. This is what you want to run before your next commit: `git rm -r --cached ./coverge`

### Testing with Devise
3. Now this is where things get tricky. The moment Devise is installed all my feature tests start failing as you can't navigate anywhere without being a fully verified bona-vide user. This article walked me very gently through the maze of gems and terms like factory and warden and middleware and prevented me from saying "Who needs tests anyway?!"
[Testing Rails with Devise](http://willschenk.com/setting-up-testing/)

Official Challenge Instructions
------

## Instructions

* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
