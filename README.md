# :camera: :milky_way: GalaxyGram :milky_way: :camera:

### User Stories

#### Version 1: MVP
```
As a user
So that I can share my experiences
I would like to add photos

As a user
So that I can contextualise my posts
I would like to add a description to my photos

As a user
So that I can fix my mistakes
I would like to delete my posts

As a user
So that I can add my input
I would like to write comments on photos

As a user
So that I can show my appreciation
I would like to be able to like a picture
```

#### Version 2: User login
```
As a user
So that I can join Instagram
I would like to be able to sign up

As a user
So that I can get into my Instagram
I would like to be able to sign in

As a user
So that I can end my session on Instagram
I would like to be able to log out

As a user
So that I can know if I am logged in
I would like to see a link to edit my profile

```


#### Version 3: setting limits on what site visitors can do
```
As a user
So that I can prevent others from creating my posts
I would like to be logged in to create posts

As a user
So that I can prevent others from editing my posts
I would like to be able to edit the posts I have created

As a user
So that I can prevent others from deleting my posts
I would like to be able to delete the posts I have created

```

## Local installation and deployment instructions
### Setting up the project
* Install Homebrew: `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* Install Ruby Version Manager: `\curl -L https://get.rvm.io | bash -s stable`
* Install Ruby 2.4.0 or above: `rvm use ruby --install 2.4.0`
* Install Rails 5.1.0 or above: `gem install rails`
* Install postgresql: `brew install postgresql`
* Install bundler: `gem install bundler`
* Install the gems: `bundle install && bundle update`
* Install Image Magic: `brew install imagemagick`

### Creating the databases
* Start postgresql: `brew services start postgresql`
* Create the databases: `rake db:create`

### Running the test suite
* Running RSpec: `$ rspec`
