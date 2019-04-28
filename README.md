Instagram Challenge
===================

[![Build Status](https://travis-ci.org/amyj0rdan/instagram-challenge.svg?branch=master)](https://travis-ci.org/amyj0rdan/instagram-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/616dd311f28ad8c5618d/maintainability)](https://codeclimate.com/github/amyj0rdan/instagram-challenge/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/616dd311f28ad8c5618d/test_coverage)](https://codeclimate.com/github/amyj0rdan/instagram-challenge/test_coverage)

Week 8 weekend challenge from Makers Academy.

## Task

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

## Getting started

```bash
> git clone https://github.com/amyj0rdan/instagram-challenge
> bundle install
> bin/rails db:create
> bin/rails db:migrate
```

## Running tests

```bash
> bundle exec rspec # Run the tests to ensure it works
```

## Usage

```bash
> bin/rails server # Start the server at localhost:3000
```

## Screenshots

#### Index page - sign up
<img src="https://user-images.githubusercontent.com/45539085/56868434-49077500-69ea-11e9-96ce-1e5203314cfb.png" alt="index-page" width=30%>

#### Sign in
<img src="https://user-images.githubusercontent.com/45539085/56868475-b87d6480-69ea-11e9-9539-482a7ade0a2e.png" alt="sign-in" width=30%>

#### Posts index
<img src="https://user-images.githubusercontent.com/45539085/56868480-c9c67100-69ea-11e9-868a-8b8bd21ecdbe.png" alt="posts-index" width=30%>

<img src="https://user-images.githubusercontent.com/45539085/56868483-d9de5080-69ea-11e9-91e1-d8c9ac05c589.png" alt="post-comment" width=30%>

#### Add post
<img src="https://user-images.githubusercontent.com/45539085/56868491-eebae400-69ea-11e9-9920-35c9f206138b.png" alt="add-post" width=30%>

## User stories

```
As a person who likes cats,
So I can look at more pictures of cats
I want to be able to create an InstaCat account
```

```
As a user,
So that I can continue to see pictures
I want to be able to sign in to InstaCat
```

```
As a user,
So that my account details are secure
I want to be able to sign in to InstaCat
```

```
As a user,
So that I can share pictures of my cat
I want to be able to post a picture
```

```
As a user,
So that I can tell others how cute their cat is,
I want to be able to post a comment
```

```
As a user,
So that I can appreciate pictures of other people's cats
I want to be able to 'like' pictures
```

```
As a user,
So I know whose cat is whose,
I want to see the username of the person who posted the picture
```

**Additional**
```
As a user,
So that I can change my opinion
I want to be able to update a comment
```

```
As a user,
So that I can change my opinion
I want to be able to delete a comment
```

```
As a user,
So that I can change my opinion
I want to be able to remove my like from a picture
```

```
As a user,
So that I can respect my cat's privacy
I want to be able to delete pictures
```

## Acceptance criteria (excluding additional user stories)

- User sign up
  - User can sign up from the index
  - User can enter email address and password (and username?) to create account
  - User redirected to signup page if they try to look at pictures without an account
  - User can only create an account with a valid email address
  - When a user signs up, they are redirected to the pictures page
  - When a user signs up, they see a success message
- User sign in
  - User can click on link to sign in from the index
  - User is prompted to enter their email address and password to sign in
  - User sees a success message on signing in
  - User is redirected to sign up page if they try to visit another page when not signed in
  - User is redirected to pictures page when signed in
- User sign out
  - User can see a sign out button once signed in
  - User sees a success message on sign out
- Post pictures
  - From the pictures page, user can click a button to find a picture to post
  - User can select a picture from their computer/phone and submit it
  - When the user submits the picture, they are redirected back to the picture page and can see their photo
  - Displays username of user who posted the image
- Comment on pictures
  - From the pictures page, user type in a comment and click submit
  - When a user submits a picture, they can see the comment underneath the picture
  - Displays username of user who posted the comment
- Like pictures
  - On the pictures page, user can click on a 'like' button on any picture
  - The like counter increases each time a different user likes a picture
  - A user can only like a picture once
