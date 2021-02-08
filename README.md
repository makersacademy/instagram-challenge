Instagram Challenge
===================

## Installation ##
Clone to the repo, then the console:
```
cd instagram-challenge
bundle
bin/rails db:create
bin/rails db:migrate
```

## Usage ##
In the console:
```
rails s
```
Then open a browser and navigate to localhost:3000

## Testing ##
From the instagram-challenge directory, run
```
rspec
```

## Summary ##

Quick Summary - I used vanilla JS and APIs to make the /posts page a single page app. Short User Stories (and Developer tools):

- Sign up (CSS needs sorting)
- Log in (Images not working)
- Log out
- Posts page displayed only if logged in
- Posts appear in reverse chronological order
- Users can edit only their own posts in first 10 mins
- Users can delete only their own post
- Users can create a new post with or without image

- Dev: Posts retrieved from API
- Dev: Edit and delete are done through API
- Dev: Creating without image is done via API
- Dev: Creating with image is or isn't done with API?

## Questions for Coach ##

**Images with or without API**\
Spent quite a long time researching how to send images via API... Couldn't quite get there so kept it as redirect, but I am now wondering which method is a better/safer/preferred method for uploading images (a small google search didn't seem to bring up any significant opinions / thoughts on this).

**Ways to get current user**\
Current user? Fresh api or returned with current apis? Or taken from username of logged in user printed on top of page? What is the safest/preferred way to do this?

**Creating new posts with API**\
When a new post is created, is it best to append this to the div as an individual post as opposed to re-running the getAllPosts API request? I imagine it is best in terms of speed but this means more written code which can lead to a greater possibility of more bugs?

**Set HTML or create elements?**\
How to write posts in JS. Is it better just to set HTML as a string (eg my addPostImageHTML and postCaption functions), or to create elements, add ids and classes and append them (renderIndividualPost, addPostDetails, addDeleteButton, editPost)? The latter seems to create more code. I have refactored a number of times and not settled on a preference!

**How deep into SRP should I go**\
For example, the addPostDetails function. We could say this function renders the post details (which sounds SRP). Or we could say it creates the div, assigns the div appropriate attributes, sets the div's html and appends the div to the post (definitely not SRP). Should I be breaking this function down into multiple functions?

**TESTING - Big Question**\
Current stats: 31 examples, 6 failures. Coverage 65/77 (84%)\
This is the part I feel I need most help with. I'd really appreciate it if you could have a thorough look at my tests to see if I am testing a full stack app appropriately and guidance on how I can improve here. I'm a bit lost with it and as I was refactoring I think I must have started to implement code without writing tests so my coverage is down at 84%. I'm also having a huge error with ActiveSupport::MessageVerifier::InvalidSignature whenever a post is being created in the tests so I would really appreciate some help figuring that out. Many thanks.

-----------------------------------
Very open but I wrote down user stories and it seemed more doable.

For user authentication I used the gem Devise which builds a lot of the routes and authentication methods. It has a nice feature of setting different roots, depending on whether a session is in clear or otherwise, and also allows you to divert any requests to other paths to the sign up /login page with the method   **before_action :authenticate_user!** in the controller. It also automates error messages which I need to adapt.

Posting pics needed ActiveStorage and **has_one_attached :image** in the Post model.

Used [this blog](https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one) to help set up API.


Testing Lessons:
User module FeatureSpecHelper and include it in rails_helper to use across feature tests
Use factory bot to populate table data (eg create users and posts. I'm using it to test the api.) Also a RequestSpecHelper.


To clear images from test database:
https://edgeguides.rubyonrails.org/active_storage_overview.html#discarding-files-stored-during-system-tests
(Haven't yet implemented this)

To do / Next Steps:
Tag posts
Like posts
Use JQuery
Use React

## Instructions

* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
