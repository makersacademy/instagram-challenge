Instagram Challenge
===================

This is my Instagram clone in Rails made over the weekend following Week 8 of Makers Acacdemy.

Test coverage: SimpleCov
Code quality: RuboCop

## How to explore this project

1. Make a clone of this repo on your local machine using
`git clone https://github.com/katemyoung/instagram-challenge.git`

2. Navigate to the `instagram-challenge` directory
`cd instagram-challenge `

3. Check you have the required ruby, sqlite3, node, yarn and rails versiovs installed. (Link to getting started)

3. Use Bundler to install the dependencies from the Gemfile
`bundle install`

4. Set up the databases
(details here - both necessary?)
```
bin/rails db:create
bin/rails db:migrate
```

4. Start the web server from the terminal
`bin/rails server`

5. In a browser, navigate to localhost:3000 and expore the app! You can ... (completed feature list here )

## How to run the test suite

`bundle exec rspec`

## How I would complete this project


## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project
4. Sketch mockups

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## User Stories

```
As a user,
So that I can share my content,
I want to be able to post a photo.

As a user,
So that I can keep my content secure,
I want to sign up for an account.

As a user,
So that I can access and create my own content,
I want to log in to my account uisng my username.

As a user,
So that I only I can access my account,
I want to be able to log out.

As a user,
So that I can interact with my friends,
I want to be able to write a comment on a post.

As a user,
So that I can show which photos I like,
I want to be able to like a post.

As a user,
So that I can access my account more flexibly,
I want to be able to login with an email or phone number.

As a user,
So that I can personalise the content that I see,
I want to follow other users.

As a user,
So that I can describe my content,
I want to be able to add a caption to my photo.

As a user,
So that I can make my photos look great,
I want to be able to add a filter.

As a user,
So that I can see what has been posted, 
I want to be able to see a list of all posts,

As a user,
So people know which post is mine,
I want my username to be displayed with my post.

As a user,
So that I can see what has been posted,
I want to see all my posts.

As a user,
So that I can remove unwanted content,
I want to be able to delete my post.
```

Routing

```
instagram.com's routing:
/
/create/select
/create/style
/create/details - This is where you add the caption. Has a share post button
/create/upload - "Your post has been shared"

/accounts/emailsignup

 
```

## Mockup



## How I appraoched this challenge
(link to Trello board?)

1. Planning (1h 40m)
- Made a Trello board using the Acebook Challenge template board.
- Looked at Instagram website to see how it worked from a user's perspective
- Draft user stories 
- Mockup the site
- Estimate first feature (post photos) and create acceptance criteria

2. Set up Rails app (1h 40m)

3. TDD features

## My developer practice
- Used toggl to track my time
- Used a pomodoro timer to ensure I took regular breaks
- Commit regularily
- use linter to check quality code 
- use simplecov to check test coverage
- attempt a TDD approach, whilst still learning rails


## Reflections


## Questions

## Next time I would:

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
group :development, :test do
  gem 'rubocop', '1.20', require: false
  gem 'rubocop-rails'
end
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
