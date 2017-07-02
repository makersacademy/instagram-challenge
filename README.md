# README

Instagram Challenge
=================

Technologies
-----
* Ruby v '2.4.0'

* Rails v '5.1.2'

```bash
$ bundle install
```

* postgresql - connect to the databases locally & be sure to migrate
```bash
$ psql \c pgapp_development
$ psql \c pgapp_test
$ rake db: migrate
```

* [Paperclip](https://github.com/thoughtbot/paperclip) - file attachment manager - read documentation for full dependencies
```bash
$ Paperclip.options[:command_path] = "/usr/local/bin/"
brew install imagemagick
gem "paperclip", "~> 5.0.0"
```

* [Clearance](https://github.com/thoughtbot/clearance) - Rails authentication with email & password
```bash
$ gem install 'clearance'
$ rails generate clearance:install
```

* deployment - currently on the local server
```bash
$ rails s
```

Test suite
-----
* Rspec
* Capybara
```bash
$ rspec
```

Task
----
## The Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need users who can post pictures, write comments on pictures and like a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

My Approach
----
- **Card wall & estimation** - I started the project by creating a Trello card wall of the different User stories, including an estimation using the Makers points scale on the time it would take to complete.
![Imgur](http://imgur.com/a/WSSBq)
![Imgur](http://imgur.com/a/LiuNh)
- **Users can post a picture** - I started my project by with the most useful feature the MVP could achieve: that a user could post pictures.I used [Paperclip](https://github.com/thoughtbot/paperclip) as my file attachment manager of choice.
![Imgur](http://imgur.com/a/gCFtu)
The Picture model has two key properties: a description, and an image.
- **Users can post comments** - I then built the next most useful feature: allowing users to add comments to posts. I did this by generating a new Comment model that belonged to the Picture model.
![Imgur](http://imgur.com/a/8QS8C)
- **Users must be signed in to use Innstagram** - After completing two of the core features and having an MVP that met most of the requirements, I then included [Clearance](https://github.com/thoughtbot/clearance) as my rails authentication of choice. Before users can upload a picture or comment they must be signed up, or signed in.
![Imgur](http://imgur.com/a/rkxz5)
![Imgur](http://imgur.com/a/b6Q8y)

Challenges
----
- **Users can post a picture** - I experienced some difficulty with my initial Picture controller & routing with Paperclip. I spent a lot of time troubleshooting and on the second day, I took the decision that it would be better to start again from scratch with the project. Whilst, this meant I lost some time and therefore didn't get to the Likes feature I felt overall this helped me create cleaner code as I struggled to get visibility on my application given the sheer volume of files created by Rails throughout my amendments.
- **Testing** - Whilst working with my first feature I encountered difficulty configuring Rspec & Capybara. I restarted my project from scratch & tried to fix this to make sure I had feature & unit tests for all my features. In the end I wasn't able to get this working, and so took the decision to at least keep building features to enhance my knowledge of rails. This goes against the TDD principles I've learnt at Makers, and it's something that I wish I could have resolved before submitting.

Future Improvements
----
- **Tests** - I would like to get my Rspec & Capybara configuration set up so I can test all my features. Testing retrospectively isn't ideal, but it beats no tests- which is the current situation.
- **Users can like pictures** - I would like to extend the program to get to this next feature.
- **Users are associated with Pictures and Comments** - The next enhancement I would make would be that Users are connected to their Pictures and Comments.
- **Navigation Menu**- The CSS and general presentation of the project leaves much to be desired. In the future I'd like to improve the appearance of the project so it was a bit more user friendly.
- **Heroku deployment** - On my first iteration of the project I had set it up to be running on AWS & deployed on Heroku. Unfortunately as I restarted the project this work was lost. I'd like to set this up again for the project, so that photos are stored on AWS.
- **Travis CI** - I'd like to have Travis set up for this project in the future.
