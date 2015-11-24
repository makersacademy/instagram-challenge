Instagram Challenge
======================

Synopsis
-----

The task set was to build an application which functions like Instagram. The web application should be able to store images and user details.

Features:
-------

```sh
As a user
So that I can sign up
I must be able to sign up

As a user
So that I can sign in
I must be able to sign in

As a user
So that I can like images
I must be able to like images

As a user
So that I can comment on images
I must be able to comment on images

As a user
So that I can delete my own images
I must be able to delete my own images

As a user
So that I can edit my own image title
I must be able to edit my image's title
```


Approach towards solving the challenge
--------------------------------------

In order to solve the challenge I decided on creating three seperate classes. One for the game itself, another for the human players and last but not least, a class for the computer player.

I built the system using test-driven development to ensure that bugs can be eliminated. As you can see the build has 100% coveralls and all rSpec tests are passing.

The RPSLS game is fully functional. If you feel that there are any errors or improvements can be made then please let me know.


Technologies used:
------
* The application was coded in Ruby using Sinatra.
* RSpec was used in order to conduct test-driven development.


Bonus:
-----

This game can be played by two players. The game also has lizard and spock in the list of items you can choose from.


Steps of playing the game
---------------------------------
```
irb(main):001:0> require './lib/game.rb'
=> true
irb(main):002:0> g = Game.new
=> #<Game:0x007fd78a8587c0>
irb(main):003:0> p1 = Player.new
=> #<Player:0x007fd78a82b158>
irb(main):004:0> p2 = Player.new
=> #<Player:0x007fd78a810088>
irb(main):005:0> p1.choose(:rock)
=> :rock
irb(main):006:0> p2.choose(:lizard)
=> :lizard
irb(main):007:0> g.play(p1,p2)
=> :player_wins
```

Installation:
------

To run the application you can either visit it on Heroku (https://shielded-refuge-7357.herokuapp.com/)

-- or --

Download a clone of this repo and use Rackup to run it on your localhost.


Tests
------

You can check the tests by running 'rspec' in the root folder in terminal.
