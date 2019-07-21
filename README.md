Instagram Challenge
===================

Enjoy it live on [https://fauxtagram.herokuapp.com/](https://fauxtagram.herokuapp.com/)

## How tos:

Download or clone.

`> bundle install`  
`> bin/rails db:create`  
`> bin/rails db:migrate`  

Add your own Cloudinary credentials and replace the environment variables accordingly.

`> bin/rails server` - starts the server. Open `http://localhost:3000` in your browser to view.

To run tests:  
`> bundle exec rspec`  
`> bundle exec rubocop`  


## User stories

- [x] As a user, so that I can share my pictures, I would like to be able to post pictures
- [ ] As a discerning user, so that I'm not contributing to some shady business, I would like to sign up to Fauxtagram with authentication
- [ ] As a user, so that I can become an influencer, I would like to see my username next to my posts
- [ ] As an influencer, so that I can get sweet sponsorship deals, I would like my posts to be liked and show the # of likes
- [ ] As a kind user, so that I can spread kindness, I would like to be able to heart posts I enjoy

**nice to have**

- [ ] As an influencer, so that I can generate zeitgeist, I would like to have a comment section on all my posts
- [ ] As a user, to save my time and sanity, I want to be able to filter posts to see only those relevant to my interests

## Development todo: 

- [x] Produce some stories, break them down into tasks, and estimate
- [x] Fork this repo, clone, etc
- [x] Initialize a new rails project
- [x] Add rubocop
- [x] add instructions to README
- [ ] first feature test

## Known problems:
- [ ] Dotenv .env file doesn't seem to be visible to cloudinary.yml - something went wrong with the Dotenv setup and its subsequent removal to resolve deployment problems
- [ ]

## Credits:

In this challenge I used the following resources:

- [this tutorial on creating a Rails photo sharing app with Cloudinary](https://pusher.com/tutorials/photo-sharing-ruby-rails)
- [this Eliot Sykes repo](https://gist.github.com/eliotsykes/6fc16f428d4e6bb9b32d)
- [previous week's Makers challenge repo](https://github.com/bengscott2/acebook-livewire)
- [this tutorial on switching from the default sqlite to a PostGres db](https://www.daveferrara1.com/ruby-in-rails-switch-from-sqlite3-to-postgres/)
