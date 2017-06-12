# Instagram Challenge

A basic clone of Instagram. After creating an account, users can post photos, like photos, and see photos uploaded by others. One like per photo per user.

![the chinstagram photofeed](http://i.imgur.com/9NpF0M2.png)

## Usage
### Option 1: Use the app on Heroku
Try it [here](http://chinstagram.herokuapp.com/).

### Option 2: Deploy locally
The following assumes you have Ruby and PostgreSQL installed.
```
git clone git@github.com:adc17/instagram-challenge.git
bundle install
rake db:create db:migrate
rails s
open http://localhost:3000/
```

## Tests

```
bundle exec rspec
```

## Technologies

* Language: [Ruby](https://www.ruby-lang.org/en/)
* Framework: [Rails](http://rubyonrails.org/)
* Image Uploads: [Paperclip](https://github.com/thoughtbot/paperclip)
* Image Storage: [AWS S3](https://aws.amazon.com/s3/)
* Secure ENV variables: [Figaro](https://github.com/laserlemon/figaro)
* Users: [Devise](https://github.com/plataformatec/devise)
* Likes: [Acts as votable](https://github.com/ryanto/acts_as_votable)


* ORM: [Active Record](https://github.com/rails/rails/tree/master/activerecord)
* Database: [PostgreSQL](https://www.postgresql.org/)
* Tests: [RSpec](http://rspec.info/)/[Capybara](http://rspec.info/)
* Continuous Integration: [Travis](https://travis-ci.org/)
* Hosting: [Heroku](https://www.heroku.com/)

## Challenges

The main challenge this week was maintaining Ruby TDD discipline. With so many moving parts in the form of gems and Active Record, it was easy to get distracted.

## Strengths
I understand Travis and Heroku a lot better after this week, and I implemented a helpful Heroku Pipeline setup for testing different iterations of the app. 

Upon submitting a pull request that passed my CI tests, a new version of the app was automatically created and initialized. I then tested the new version and merged the PR. Once the merge was complete, the trial app was cleaned up and the official app was updated:

![Badass Heroku/Travis Setup](http://i.imgur.com/N3WS6GH.png)

### User Stories

```
as an egotist
so i can show the world my life
i'd like to post pictures online

as an egotist
so the world knows they're looking at my life
i'd like my pictures to be associated with my user account

as a lonely individual
so i can feel less starved of social interaction
i'd like to 'like' photos of other peoples' lives

as a lonely individual
so i can feel less starved of social interaction
i'd like other people to like photos of my life

as an individual nervous about their social ranking
so i can get a clearer idea of peoples' popularities
i'd like photos to only be likeable once per user

as a lonely individual
so i can feel less starved of social interaction
i'd like to comment on photos of other peoples' lives

as a privacy-conscious person
so i can feel secure about who views my photos
i'd like people who use the site to at least be signed up

```

## Other Notes

A weekend challenge during the [Makers Academy](http://www.makersacademy.com) Bootcamp.
