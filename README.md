# Welcome to Flipper!

Flipper is an early-stage attempt at merging my passion for coding and my captivating hobby, photography.
It was intended as a Flickr clone and was developed as a weekend project to get familiar with Ruby on Rails.

## Stack

* Ruby
* Rails
* RSpec
* Devise
* Sqlite3

## Forking

* Make sure you have Rails installed.
* Fork & clone the repo.
* Run `bundle install`
* Migrate the database
  * `rails db:migrate` to migrate the development database and `rails db:migrate RAILS_ENV=test` if you are want to run the tests with `rspec`
* Fire up the server using `rails server`

## Features

* User gets greeted by a homepage
![Alt text](/docs/readme_pics/home.png?raw=true "Home screen")
* User can see a list of posts by previous users
![Alt text](/docs/readme_pics/index.png?raw=true "Index of posts")
* User can add a new post with Photo and short Description

* Users can create, review, update and delete posts (CRUD)

* Posts can have comments, which are displayed in reverse chronological order and include User who posted the comment, Body and Created_at
![Alt text](/docs/readme_pics/comments_top.png?raw=true "Comments top")
![Alt text](/docs/readme_pics/comments_bottom.png?raw=true "Comments bottom")

## Approach

* Diagrammed the MVC and made sure to structure classes/models before starting to write the code.
* Rigurously followed TDD/BDD to implement new features.
* Ran into migration issues which forced me to revert to previous commits, thus solving merge conflicts by unleashing the full power of Git version control!!
* Unfortunately, the aforementioned migration issues took a while to fix and prevented me from adding features that I would have loved to have as a part of MVP v2

## To be added

* Linking Users to their posts and preventing other users from deleting Posts that aren't theirs.
* *Flash*, a feature based on Medium-claps but linked to Users.
* Index of Users who have *flashed* a Post
* Filters for the Photos
