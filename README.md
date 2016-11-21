PictureFace(an instagram clone)
========================
This project was built with reference to [Ben Walkers Instagram clone walkthrough](https://www.devwalks.com/lets-build-instagram-in-rails-part-1/)

* I started the project by using the rails command `rails new picture_face -d postgresql -T` in order to intialize the project using PostgreSQL as my database and without the default testing framework

* The next step was to set up development and testing databases like so
```
bin/rake db:create
bin/rake db:migrate
bin/rake db:create RAILS_ENV=test
bin/rake db:migrate RAILS_ENV=test
```
* I set up Rspec as my testing framework by adding the following to my Gemfile and running `bundle`
```
group :test do
  gem 'rspec-rails'
  gem 'capybara'
end
```
* I then ran `bin/rails generate rspec:install` in order to get rspec going by creating a spec directory with 2 helper files, spec/spec_helper.rb' and 'spec/rails_helper.rb, and a .rspec behaviour configuration file

* In order to allow capybara testing I added the line `require 'capybara/rails'` to spec/rails_helper.rb

* Included `gem 'factory_girl_rails' in Gemfile, Factory Girl let’s you create active record objects to test against, add `config.include FactoryGirl::Syntax::Methods` to the `rails_helper.rb` inside the `Rspec.configure` block to prep configure rspec to use factories

* `brew install imagemagick` to help paperclip gem for image uploading

* Included `gem 'paperclip'` in Gemfile for image uploads

* Included `gem 'devise'` in Gemfile for User Sign in and out

* Included `gem 'dotenv-rails'` in Gemfile for storing of secrets

* Included `gem 'shoulda-matchers'` in Gemfile for testing associations, include `config.include(Shoulda::Matchers::ActiveRecord, type: :model)` to complete setup

* Included `gem 'aws-sdk'` in order to use Amazon Web Services for image storing. Added config in the following format for development and production environments
  ```
    config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }
  ```

* Time to start TDD'ing and developing the app

  - In order to create new controllers run `bin/rails g controller name_of_controller` from the command line, then migrate

  - In order to create new models run `bin/rails g model model_name field_name:data_type from the command line, then migrate

  - In order to create a migration to add images to a model (using paperclip) `bin/rails g paperclip model_name image`

  - In order to create a migration to add a reference for associations `bin/rails g migration AddModelparentRefToModelchild parentmodel:references`

  - To build a default factory for posts create `spec/factories/post.rb` and use the following template to build a factory
    ```
    FactoryGirl.define do
      factory :post do
        caption "nofilter"
        image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpg', 'image/jpg')
      end
    end
    ```

  - In order to allow unit tests on models in the following format add this to the Gemfile and `bundle` afterwards `gem 'rspec-collection_matchers'`
      ```
      describe Restaurant, type: :model do
        it 'is not valid with a name of less than three characters' do
          restaurant = Restaurant.new(name: "kf")
          expect(restaurant).to have(1).error_on(:name)
          expect(restaurant).not_to be_valid
        end
      end
      ```

  - `bin/rails g devise:install` to setup devise

  - add `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }` to development environment

  - `bin/rails g devise User` to generate User model for devise



Instagram Challenge
===================

Instructions
-------
* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

Build Instagram: Simple huh!

Bonus if you can write your own set of sensible user stories!

As usual please start by forking this repo. After cloning your fork and cd'ing into it, you'll need to [initialize a Rails app in the current directory](http://blog.jasonmeridth.com/posts/create-rails-application-in-current-directory/).

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!
