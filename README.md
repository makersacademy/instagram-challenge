Instagram Challenge
===================

## Task

Makers Academy week 8's weekend challenge consists of building Instagram using Rails.
**users** can post **pictures** and write **comments** on pictures.

## Reflection
I have not had the chance to implement the like function yet and working on the look of the page with CSS but this is something I will look at completing shortly.

## Setup and running

Clone the repo on the command line:
```
$ git clone https://github.com/Albion31/instagram-challenge.git
$ cd instagram-challenge
```

Install bundle and run it to install dependencies
```
$ gem install bundler
$ bundle install
```

Create and migrate the database
```
$ rake db:setup
$ rake db:migrate
```
Run the app
```
$ rails s
Go to http://localhost:3000 on your browser
```


## User Stories

**_Step 1 - MVP_**

```
As a user,
So that I can share my adventures with my friends
I want to be able to create a new post with an image
```

```
As a user,
So that I can describe my adventures
I want to be able to add a caption to the image I post
```

```
As a user,
So that I can modify my post
I want to be able to edit my caption
```

```
As a user,
So that I can remove my post
I want to be able to delete it by removing the image and caption
```

```
As a user,
So that I can see what I have posted
I want to be able to see them all on my page
```




## Author
[Lan Pham](https://github.com/Albion31)
