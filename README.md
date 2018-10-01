Instagram Challenge
===================

The challenge was to build Instagram using Rails. I needed users who can post pictures, write comments on pictures and like a picture.

I called my clone Pictogrammie.

## User Stories

```
As a user
So that I can view photos of others
I want to be able to view all posts
```
```
As a user
So that I can view the recent photos first
I want the photos to be posted in reverse chronological order
```
```
As a user
So I can use post my own photos
I want to be able to sign up
```
```
As a user
So that I post my photos
I want to be able to upload a picture
```
```
As a user
So that I can give the photo context
I want to be able to give the photo a caption
```
```
As a user
So that I can show others what photos please me
I want to be able to give a photo a like
```

## Screen Shots

![alt text](./public/screenShot1.png)

![alt text](./public/screenShot2.png)

## Set-up

Clone this repo:

```
git clone https://github.com/LondonJim/instagram-challenge.git
```
Enter the directory:

```
cd instagram-challenge
```

Install all the relevant gems:

```
bundle
```

Set up the PostgreSQL database:

```
rake db:drop db:create db:migrate db:seed
```

## How to Use

There are currently two ways to use Pictogrammie

#### Local

In terminal enter
`rails s`

Then in your client enter `http://localhost:3000/`

#### Working Deployment

Heroku
`https://pictogrammie.herokuapp.com`

## Reflection

This was my first individual use of rails and keeping track of all the connections between the routes/controllers/models/views was to begin with.  Using devise to control the user interactions was useful but I had to add some code which I still need to research to how it works. I did attach my AWS S3 server so the app can upload pictures to it but I still to get it to work, currently the Heroku deployment wipes the pictures every so often so they need to be held on externally.

Testing was mainly feature testing with a few unit tests for methods added, I would have liked more time to investigate the use of methods added when some gems were integrated. 
