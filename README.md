Instagram Challenge
===================

This is my Instagram clone in Rails made over the weekend following Week 8 of Makers Acacdemy. I Implemented the user story features: add a photo, see photos and add a caption.

This app is deployed on Heroku: https://tranquil-basin-31776.herokuapp.com w

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

[Please click here to see a mockup of the Instagram site made with draw.io](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Mockup%20Instagram%20Challenge.drawio#R7Vxbk5s2GP01nj7Fg8Bc9nEv2aSddLrT7UybR62RbbaAKMhZO7%2B%2BEkg2uvjGAoY2eYn1ITCc7%2Bi7HLSeOPfJ5lMOs9WvOETxxLbCzcR5mNg2sAOP%2Fscs28oSWE5lWOZRyCftDc%2FRd8SNFreuoxAV0kSCcUyiTDbOcZqiOZFsMM%2FxmzxtgWP5WzO4RJrheQ5j3fpnFJIVfwrb39s%2Fo2i5Et8MvJvqSALFZP4kxQqG%2BK1mcj5OnPscY1J9Sjb3KGbgCVyq8x4PHN3dWI5Scs4Jv3z6%2Fjr3t2S1eX26v%2F%2Fj8%2B%2Bb%2BW8fbO6egmzFE6OQAsCHOCcrvMQpjD%2FurXc5XqchYpe16Gg%2F5wvGGTUCanxFhGy5N%2BGaYGpakSTmR9EmIn%2Bx06cuH32tHXnY8CuXg60YpCTf1k5iw6%2F1Y%2FvTypE4b4FTwm8EeHx8j2Ocl0%2FrWOU%2Fai8IzMktYww9kOKUPagOMUe9wOt8jo7hyvlBL7pE5NhEt5rIUK99BXfhJ4QTRJ%2BGTshRDEn0TaYl5Oxe7ubtCUA%2FcA5cwAfPuiYfQI0N1tR2jxKi7ljriGP3xJFowy9%2FhDnNvQ%2FOdD6w23Y%2BP%2FUJR%2FSebYuHYdfhbuVBGIixuER1p%2FwshUK723gHq%2Fgdf4Pxmj%2FDc7RMqWWdGfn2Bb7QPCJxBMbsDOdhTr2BqI%2FvvqGcRDRQ3%2FIDSRSGFR1REX2HL%2BX1mB8z9ljlg7p3E%2FfhAuroDDi6aNgdoY3kI56W%2BN1IkV9yMD%2FLmoIABLKvqlFTBogpeLEoUCfO1X2rufRtFRH0nMFy0bzRQkFxbZFVqXsRbVgYObzyNIQPIunLjJ%2Fx4ds%2BhzvCbata%2Ft4ZW4%2BstgYTSmAUa1jJwfQEci0ABQJX5psBql28kKDqCqmZhlQGi%2BIN5%2BHwwApMYLk9guVqYH3BS3ZSegQs0AtYuxqeg7WrhGtgBX0Sy9ewesDpTyxKriCNrPQbWUqC8zkFit7L44TdsBfTj3cv9MOSlLhUBpYyyvgusob3zxpXE8r8sVjUTdW5tZxXXYQ%2BRXUd%2BdrUXPs%2BxYsUfCK7qiA5%2FhuJ%2FMVL10UUx4rp%2FAxq4oa81NpYS65CjxudHjsK1fkx64ofgSGTNXS%2FZdVNNf8JI7vAh6KsQW7pBOBlG50wP6e0K1nmMBk%2FYQwl1uNjW3FmJhHJwCNjqu%2BKRoKzEo8e35e7zu1ihctitCDtoNuwkLK7QtfTC6mDGa9PKUNqXf3jreuuJQVyS%2BqfakmbNy5nt64c3tO966SL1vU2z%2BG2NoH3bgc721kg09MBigh22Xz6obqDdttf58Tib4l3ZwpoMunGw7ihSWV6n0ID0ZI61fZgwuJ3%2BlJkVf4%2FEJtGJnM4B3LHxTLHB2sKHOBLK3H4OoeeeDSnXkHocGfNEnR3SgdwNKCGIXV4rj0dmtgBBqx26HiZWvh%2B9Q6gCx6HpeS%2BFQ%2FPv1EB83TAetU8gKfhdRvnCIbb3mSPfXk%2B9ia2DYrYQ1M9gC6L%2FZA9RiB7eMHAZA%2BTfDZa2aNpWdWZ7uHqTeRQ38w3fuPeQ7PJd%2BecbDYdvriG0mzqZc%2BcZnHC0neGC2LkxrjaS7fV9hJ4PK0NuKG8MQTM6zeUquBryCt9vzrXe6RmBYlcPhRZWfg2LFK0GumJLsPCXJrsbNVXama5uPm%2FFTLq%2BxvXkGt7rWRsPdiOuJJpup47q2RsveE4%2BAZnOOQ%2Fx3ltLAalP5wZFJd%2BF4OprL9eITqkLcMoDVvbMHzullGxeLreMmq7av%2BjEKx6Im3L6OkLqUJGx3tPbb3KylaY0uu9pVaPQQEo%2B3dd07Yzk2i0M7YeFsQdjRnWXSAdEKz6btrRwaqy1QfXh9UeP6wqW4cAq%2F6mT2nMTjdXlqm5EtrG2DqknqjgqIHLQIVei0R3dtWaUBInx7v3SmiOp%2Fde3bRdBL5PnNTfMRbrlyRiAeC%2FIk4KCaoNcdIKROAULwGr0XClSsekwF1fqnTV3uL6WqVj0o4Gp1Uq7w5%2BaJaXMs%2FzbTkDmzYSWV6PKdjRgzC9jnD0OKXLxuu7M%2B1ypjcSBYpZYKOPauwoGkPdqMa4gMGer%2BxVMra%2FtgHdmdsVunqagWHIYibMSISP%2FUnb0MH1DBvBzOB2Rl09QDyZirOLNs31iWkQKJj6Bm3cD3qMuTNdG0cbmGQxmr5m7I1GFRvYlvDBJsi%2BvOcDeT2Il2xSwvT7dJ7p9Xsb4kWmvAgeSaXUl3ahatkG7aLXHdju0R3FFkvpdB0jkeCpZ61FjhP2BLShL0cRSsNiOgLfdr3IwUzdYG%2FwrnF7a3fu1WP0ukB5CpN3lsVt4KX%2FQYLxBwXawYsO9782VSkD%2B9%2Fscj7%2BCw%3D%3D)

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
  
