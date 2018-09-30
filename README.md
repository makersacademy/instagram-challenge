# Instagram

## Task
Create an instagram clone. Easy.

## How do I run it?

##### Download the app
```
$ git clone git@github.com:LazySamir/instagram-challenge.git
$ cd instagram-challenge
$ bundle
```

##### Set up database
```
$ rake db:drop db:create db:migrate
```

##### Start the server
```
$ rails server
```

### How do I use it?
- go to localhost:3000

## Spec
Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## User Stories
```
As a user
So I can created an account
I want to be able to signup
```
```
As a user
So I can access my account
I want to be able to login
```
```
As a user
So I can show off
I want to be able to post pictures
```
```
As a user
So I can see what people have been doing
I want to be able to see all pictures posted
```
```
As a user
So I can don't have to keep scrolling down to see new pictures
I want to be able to see newest pictures first
```
```
As a user
So my mistakes don't last forever
I want to be able to delete my pictures
```
```
As a user
So I can show my love for other users' pictures
I want to be able to like pictures
```
```
As a user
So I can be sure likes haven't be gamed
Users can only like a post once.
```
```
As a user
So I can create a conversation
I want to be able to comment on pictures
```

## Database Tables

```
+----------------------------------------------+
|                   Pictures                   |
+----------------------------------------------+
| id | user_id | url | created_on | updated_on |
+----+---------+-----+------------+------------+


+------------------------------------+
|                Users               |
+------------------------------------+
| id |  full_name | email | password |
+----+------------+-------+----------+

+------------------------------------------------------------+
|                           Comments                         |
+------------------------------------------------------------+
| id | user_id | picture_id | body | created_on | updated_on |
+----+---------+------------+------+------------+------------+

+---------------------------+
|            Likes          |
+---------------------------+
| id | picture_id | user_id |
+----+------------+---------+
```