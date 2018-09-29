# Instagram Challenge

## The Mission
Build Instagram using Rails. 

## How to Set-up

Clone this repo and navigate to the directory: 
```
git clone https://github.com/EsamAl-Dabagh/instagram-challenge.git
cd instagram-challenge
```

Install all the relevant dependencies:
`bundle install`

Set-up the database:
`rake db:drop db:create db:migrate db:seed`

## How to Use

`rails server`

Then navigate to `http://localhost:3000/` in your browser.

## User Stories

```
As a user
So that I can use the service
I want to be able to sign up
```
```
As a user
So that I can share my images
I want to be able to post a picture
```
```
As a user
So that I can interact with other users
I want to be able to comment on other users' pictures
```
```
As a user
So that I can quickly give kudos for a picture
I want to be able to like a picture
```


## Domain Model
```
╔════════╗         ╔═════════════╗        ╔═══════╗
║ Routes ║ ------> ║ Controllers ║ ---->  ║ Views ║
╚════════╝         ╚═════════════╝        ╚═══════╝
                          |
                          |
                      ╔════════╗
                      ║ Models ║
                      ╚════════╝
```
