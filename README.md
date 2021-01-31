Instagram Challenge
===================


## Task

Build Instagram

* Instagram using Rails and React
* Implemented **users** who can post **pictures**, write **comments** on pictures and **like** a picture. 
* Style it like Instagram's website (or more awesome).

Bonus: add filters!

-----------------------------------------
|       Post        |       User        | 
-----------------------------------------
| belongs_to:user   | username: string  |
| comment: text     | email: string     |
| likes: integer    | password: string  |
                    | profile_url: string|
| image_url: string | slug: string      |
----------------------------------------|
|     Comments      |     Likes         |
-----------------------------------------
| belongs_to:post   | belongs_to:post   |
| username          | username          |
| comment: text     | count: integer    |
-----------------------------------------

## User stories
```
As a user,
So that I can update my followers,
I want to post a photo
```
```
As a user,
So that I can react to a post,
I want to add comments
```
```
As a user,
So that I can react to a post,
I want to like a post
```

