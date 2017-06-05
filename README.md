Instagram
===


### A Ruby on Rails application, mimicking the features of Instagram. Users can sign up and upload Photos to the feed.
### Built using Devise for User management, and Acts as Votable to aid creating the 'Like' feature. To upload Photos the app uses the Paperclip gem and ImageMagick

#### User stories:

```
As a social network User
So that I can access the feed on Instagram, start upload Photos, and like other Users Photo's
I would like to sign up to Instagram
```

```
As a social network User
So that I can share Photos with my friends
I would like to upload Photos to Instagram's feed
```

```
As a social network User
So that I can see who has posted the Photos
I would like to see the Photos author alongside the Photo
```

```
As a social network User
So that I can let my friends know that I enjoy their Photos
I would like to click a 'Like' button on to like their Post
```
```
As a social network User
So that I can talk to my friends about their Photos
I would like to comment on Photos uploaded to Instagram
```


#### Installation
You will need Install ImageMagick locally on your machine to be able to upload Photos
```
Clone this repo
brew install imagemagick
bundle install
```
You will need to migrate the databases locally on your machine
```
bin/rails db:create
bin/rails db:migrate
```
Run test with:
```
rspec
```
Start Instagram-ming!
```
bin/rails server
# go to localhost:3000 in the browser
```
