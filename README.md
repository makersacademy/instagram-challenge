# Instakilo

## Task
Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

## User Stories
```
As a user
So I can become a member
I want to be able to sign up

As a user
So I can post pictures under my username
I want to be able to login

As a user
So no one else can use my account
I want to be able to logout

As a user
So I can show others what I'm up to
I want to be able to post pictures

As a user
So I can show appreciation
I want to be able to like pictures

As a user
So I can let others know my thoughts
I want to be able to comment on pictures
```

## Planning
Database - Users, Posts, Comments
Controllers - Users, Posts, Comments, Sessions

### Users
username:string
email:string
password_digest:string

### Posts
username:string
caption:string
image:TBC
likes:integer

### Comments
postid:integer
username:string
comment:string

### Todo
- password confirmation
- only allow one username / email
- once logged in go to sessions/:user_id
- posts

### Done
- init rails
- rspec
- rubocop
- change to postgresql
- Users
- Login/Logout
