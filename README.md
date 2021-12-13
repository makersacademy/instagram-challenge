Instagram Challenge
===================

This is my Instagram clone in Rails made over the weekend following Week 8 of Makers Acacdemy. I Implemented the user story features: add a photo, see photos and add a caption.

**Test coverage:** SimpleCov. Models: 100%, Controllers: 93%. Load coverage/index.html in a browser for full report.

**Code quality:** RuboCop (not run yet)

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
RAILS_ENV=test bin/rails db:migrate - is there a better way to do this?
```

4. Start the web server from the terminal
`bin/rails server`

5. In a browser, navigate to localhost:3000 and expore the app! You can 
- add a picture
- add a caption for a picture
- see the pictures that have been added

## How to run the test suite

`rspec`

Load coverage/index.html in a browser for full code coverage report.

## How I would complete this project


## User Stories

```
As a user,
So that I can share my content,
I want to be able to post a photo.

As a user,
So that I can see what has been posted, 
I want to be able to see a display of all posts.

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
So that I can make my photos look great,
I want to be able to add a filter.

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

Time so far: 9 hours

1. Planning (1h 40m)
- Made a Trello board using the Acebook Challenge template board.
- Looked at Instagram website to see how it worked from a user's perspective
- Draft user stories 
- Mockup the site
- Estimate first feature (post photos) and create acceptance criteria

2. Set up Rails app (1h 40m)

3. TDD features
- post a photo (4h 20m so far) this included some troubleshooting of set up of new computer

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


## Test photo credits:
Photo by <a href="https://unsplash.com/@oulashin?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Sean Oulashin</a> on <a href="https://unsplash.com/s/photos/beach?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
   
Photo by <a href="https://unsplash.com/@mike?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Mike Kotsch</a> on <a href="https://unsplash.com/s/photos/winter?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  
