# Instagram Challenge - Makers Weekend Challenge

## Task

Makers Weekend Challenge to build an Instagram clone using Ruby on Rails. All user stories and design my own. I really enjoyed this challenge and regularly diagrammed the design and database relationships. I was proud to achieve all but 1 of my user stories.

## Technologies

### Framework

- Rails 4.2.8
- Devise for User Model

### Database
- Postgresql

### Testing
- RSpec
- Capybara

## MVP

```
As a user,
In order to enjoy Instagram,
I want to be able to sign up.

As a user,
In order for my details to be kept private,
I want to be able to sign in and sign out.

As a user,
In order to share pictures of my food,
I want to be able to post photos with captions.

As a user,
In order to enjoy all the photos I have taken of my food,
I want to be able to see all my photos on my profile page.
```

## V1

```
As a user,
In order for me to make any changes to my Instagram profile,
I want to be able to edit and delete my photos.

As a user,
In order for my details to be kept private,
I want to be the only person who can edit and delete my photos.

As a user,
In order to show my appreciation of a photo,
I want to be able to leave a comment on any Instagram photo.

As a user,
So I know who has commented on my photo,
I can see the username of the person who left the comment.

As a user,
So I know who has commented on my photo,
I can click on their username and see their Instagram feed.

As a user,
In order to show my appreciation of a photo,
I want to be able to like a photo.

As a user,
In order to see how much others have appreciated my Instagram feed,
I want to see how many likes I have received for each picture.

As a user,
In order to link my social media accounts,
I want to be able to log in using Facebook.

As a user,
In order to enjoy photos of other people’s food,
I want to be able to see a another user’s profile/Instagram feed.
```

## How to Run

- Clone this repo and ` cd instagram-challenge `
- Run `gem install bundle` (if required) and `bundle install`
- Create local databases using `rake db:create`
- Run database migration `rake db:migrate`
- Run rails server `rails s`
- On your browser, go to localhost:3000 to enjoy my mock-Instagram

## Challenges

- Testing the integration of gems (eg. Devise)
- 'Unliking' posts (routing correctly to delete values from another controller/database table)
