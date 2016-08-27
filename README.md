Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!


```
As a user
So I can view and share photographs
I want to be able to sign up to Instagram.
```
|Objects| Message|
| ----- |:-------|
|_User_| |
|User|sign_up|

```
As a user
So I can regularly explore Instagram
I want to be able to login and out.
```
|Objects| Message|
| ----- |:-------|
|_User_| |
|User|login|
|User|logout|

```
As a user
So I can share my photographs on Instagram
I want to upload my photographs to my account.
```
|Objects| Message|
| ----- |:-------|
|_User_| |
|User|photos_upload|

```
As a user
So I can seek inspiration
I want to view others photos.
```
|Objects| Message|
| ----- |:-------|
|_User_| |
|User|photos_view|

```
As a user
So I can seek appreciate others photos
I want to be able to leave comments and like others photos.
```
|Objects| Message|
| ----- |:-------|
|_User_| |
|User|photos_comments|
|User|photos_likes|
|User|comments_likes|
