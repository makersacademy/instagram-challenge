## _nstagram
A small instagram clone.

## Motivation
To consolidate learning of building a Ruby on Rails web application.

## Build status


## Code style


## Screenshots
Include logo/demo screenshot etc.

## Tech/framework used
Ruby on Rails with Postgresql database and Rspec/Capybara testing suite.

## Features
Like photos and add comments!

## Code Example
Pictures controller:
```Ruby
class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order("created_at DESC")
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to '/pictures'
    else
      render :new
    end
  end

  private
    def picture_params
      params.require(:picture).permit(:url, :user_id)
    end
end
```

## Installation
* Fork, and clone repo
* You may have to type `$ rvm use '2.7.0'` to implement the right version of ruby.
* Run `$ bundle install`
* Then run `$ bin/rails db:create`
* And, `$ bin/rails db:migrate`


## Tests
27 examples, 0 failures, 13 pending.

* Run `$ rspec` for full testing.

## How to use?

* Run `$ bin/rails server` in the command line.
* Navigate to 'localhost:3000' in your browser.
* Sign in to create a user account.
* Add a photo by clicking the '+' icon.
* Paste an image url into the text area.
