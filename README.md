Instagram Challenge 📸🙆🏻
===================

This weekend's challenge was to recreate Instagram using Ruby on Rails.

## Approach

Before anything, I had divided the functionalities into user stories. This allowed me to
understand what my 'Instagram program' needed to do. From there, I ordered the user stories
one by one, starting from an MVP and expanding outwards to accomplish the rest of the user
stories. This was a method for deciding my strategy on how I go about making the program.
Then, I listed what was required to accomplish each User story.

I managed to get halfway through by setting up my two top MVPS. I did not have time
to do the API creation to do the user sign in, login and logout unfortunately. 

## User Stories MVP (Accomplished)

(Accomplished)
```
As an Instagram user,
So I can see what Instagram is about,
I would like to be able to see pictures on Instagram
```
(Accomplished)
```
As an Instagram User,
so that I can see my photos on Instagram,
I would like to be able to upload my pictures on Instagram
```
(Accomplished)
```
As an Instagram User,
so that I can communicate on Instagram,
I would like to write comments on pictures that are uploaded
```

## Other User stories (That I would like to acheived) 

```
As an Instagram User,
so that I can save a picture,
I would like to be able to like a picture
```

```
As an Instagram User,
so that I can use Instagram ,
I would like to be able to sign up.
```
```
As an Instagram User,
so that I can use Instagram under my account,
I would like to be able to login.
```

```
As an Instagram User,
so that I am the only one who can see my Instagram,
I would like to be able to logout.
```

```
As an Instagram User,
so that I can use Instagram easily,
I would like to be able to have a sexy interface
```

```
As an Instagram User,
so that Instagram can be fun,
I would like to add filters to my instagram.
```

## How to use:

1. Clone the repo on the laptop. 
```
git clone https://github.com/thatdania/instagram-challenge.git
```

2. Go into the project folder
```
cd/instagram-challenge
```

3. get all the gems and dependencies 
```
bundle install 
```

4. run the following command to get the possible routes  
```
bin/rails routes 
```

5. run the server and check the Work in Progress so far!
```
bin/rails s
```


## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.48.1"
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
