# CloneStagram

## Brief
Over the course of one weekend, rebuild Instagram.

### User Stories
```
As a user,
So that peeps can see my cool photos,
I want to upload a photo.

As a user,
So that other people can see one of my photos,
I want to be able to see a particular photo

As a user,
So that I can identify a photo without looking at it,
I want to be able to name a photo

As a user,
So that I correct things if I make a mistake,
I want to be able to rename a photo

As a user,
So that I can take down a photo if I want,
I want to be able to delete a photo

As a user,
To preserve my artistic integrity,
I don't want anyone else to be able to rename or delete my photos

As a user,
So that I can see if this site is cool,
I want to be able to see photos without having to sign up

As a person,
So that I can start using CloneStagram,
I want to be able to sign up

As a signed-up user,
So that I can carry on using CloneStagram,
I want to be able to sign in

As a user with a Facebook account,
So that I can start using CloneStagram with minimum hassle,
I want to be able to sign in with my Facebook account

As a signed-up user,
So that noone else can use my CloneStagram account,
I want to be able to sign out

As a user,
So that I can show my love,
I want to be able to 'like' photos

As a user,
So that I can capriciously withdraw my love,
I want to be able to 'unlike' photos

As a user,
So that I know how many people like my photos,
I only want to be able to like a photo once

As a user,
So that I can be descriptive about my thoughts and feelings a particular photo,
I want to be able to comment on a particular photo

As a user,
So that I can retract my comment,
I want to be able to delete a comment I've made.
```

## Approach
This application is written in [Rails 5.0.1](https://rubygems.org/gems/rails/versions/5.0.1) and [Ruby 2.4.0](http://ruby-doc.org/core-2.4.0/) and consists of the following classes:

* Photo - holds an image, belongs to a user, has many likes and comments
* Users - uploads photos, likes and comments on photos
* Comments - short text statements about photos
* Likes - belongs to a user and a photo; summed per photo to show how popular it is

The application is tested at the unit level in [RSpec for Rails](https://github.com/rspec/rspec-rails) with associations and validations tested in [shoulda](https://github.com/thoughtbot/shoulda). It is feature tested in [Capybara](https://github.com/teamcapybara/capybara). Two images have been provided in `spec/fixtures` to test uploads.

User registration, sign-in, and sign-out functionality is provided by [devise](https://github.com/plataformatec/devise) out of the box, with [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook) to handle Facebook login.

Image upload is handled by [paperclip](https://github.com/thoughtbot/paperclip).

## Future Development

At present, the app is unstyled, and rather plain. It would benefit from some styling to make it more attractive to use.

Relatedly, the app is thin on prompts to the user. Some examples:

* There is no navbar, so the user can easily find their way around the app
* Some pages do not have tags that would allow the app to flash notices to the user, and guide their progression through the app.

Several controller methods would benefit from a separate module to associate the current user with e.g. comment and like creation. Currently, these creation methods are rather clunky, such as:

```
def create
  @photo = Photo.find(params[:photo_id])
  @comment = Comment.new(comment_params)
  @comment.photo = @photo
  @comment.user = current_user
  if @comment.save
    redirect_to photo_path(@photo)
  end
end
```

This is a priority refactor.

Additionally, it would be good to create likes and comments via AJAX requests; this would further thin out the controllers.

Finally, at present all images are saved to the `/public/system/photos` folder. It would be better to store them on a service like Amazon S3.

## How to Install
Download or clone this repo to your computer. When in the project directory, run `bundle install`. This requires you to have the [bundler](https://bundler.io/) gem already installed (see link).

## Getting Started
Run `bin/rails s` in the project directory and then visit `http://localhost:3000` in your preferred browser. When you have signed up for an account, you're ready to start uploading, liking, and commenting on photos!

## Authors
* [Oscar Barlow](https://github.com/oscar-barlow)
