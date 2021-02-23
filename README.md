![Project Banner](https://github.com/Mornevanzyl/news-summary-challenge/blob/master/images/GitHub_Project_Banner.jpg?raw=true)

# InstaGramParsons - Ruby/Rails

InstaGramParsons is a simple image posting/commenting/liking web-app for users who likes the sweet twang of the original cosmic cowboy, [Gram Parsons](https://en.wikipedia.org/wiki/Gram_Parsons). It was developed using the Ruby on Rails framework to satisfy the end-of-unit requirements of a challenge set during week 8 of the Makers Academy bootcamp.

## User Stories
```
As a lover of the sweet country twang of Gram Parons,
So that I can share my absolute favourite images of him,
I want to post an image and share it with others

As the #1 fan of cosmic country legend Gram Parsons,
So that I can be part of a community of like-minded fans,
I want to register as a user on an exclusive image sharing platform

As a baby-boomer who's disilusioned with mainstream country music,
So that I can show my appreciation of the perfect union of flower-power and outlaw country music,
I want to be able to comment on images posted by other fans

As a Gram Parsons fan who also happens to have a penchant for heart-shaped emojis,
So that I can show my love of other image posts,
I want to be able to 'like' other images
```

## Running Tests

```bash
git clone git@github.com:Mornevanzyl/bowling-challenge.git

open SpecRunner.html
```

## Usage

```JS
open index.html # in your browser

# Use the web interface or,
# Use the console in Chrome Developer Tools

game = new Game # returns instance of Game class

game.roll(3) # registers a roll of 3 pins
game.roll(7) # completes frame, registers a spare
game.roll(10) # registers a strike
```

## Approach
I followed a [TDD](https://bit.ly/3q65B8q) approach to satisfying the requirements of this challenge. A systematic and iterative cycle of interpreting a series of user stories and developing feature tests/unit tests/feature implmentation/refactoring.

A review of the user specification revealed that at this stage, the application is simply a [ten-pin bowling](https://en.wikipedia.org/wiki/Ten-pin_bowling) scoring app.

The ```Frame``` class handles most of the ```rolls``` and associated controls, wilst the ```Game``` class manages the frames and scoring.

## Suggested Improvements
This section outlines known/identified areas of improvement/optimisation that serve as input to future development of this project.

- Extend to multi-player functionality.

- Add responsiveness to web-interface.

##  Acknowledgements/Appreciations
- I'd like to thank the academy...
