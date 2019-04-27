Instagram Challenge
===================

Week 8 weekend challenge from Makers Academy.

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## User stories

```
As a person who likes cats,
So I can look at more pictures of cats
I want to be able to create an InstaCat account
```

```
As a user,
So that I can continue to see pictures
I want to be able to login to InstaCat
```

```
As a user,
So that my account details are secure
I want to be able to logout of InstaCat
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

**Bonus**
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

```
As a user,
So I know whose cat is whose,
I want to see the username of the person who posted the picture
```

## Acceptance criteria (excluding bonus user stories)

- User sign up
  - User can sign up from the index
  - User can enter email address and password (and username?) to create account
  - User redirected to signup page if they try to look at pictures without an account
  - User can only create an account with a valid email address
  - When a user signs up, they are redirected to the pictures page
  - When a user signs up, they see a success message
- User login
  - User can click on link to login from the index
  - User is prompted to enter their email address and password to login
  - User sees a success message on logging in
  - User is redirected to login/sign up page if they try to visit another page when not logged in
  - User is redirected to pictures page when logged in
  - When a user logs in, they see a success message
- User sign out
  - User can see a sign out button once logged in
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
