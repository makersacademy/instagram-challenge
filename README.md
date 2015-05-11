#Instagram Challenge#


Makers Academy Wk8 Challenge to build an instagram clone using rails. To add some personal interest to this I have added a particular theme to provide a service to allow site engineers to post photos of their work and allow colleagues to comment/like on this work as a peer review stratergy and communication system between site and office engineers. Introducing Engigram!

##User Stories##

```
As an engineer
I want to be able to sign in
So I can share photos of my project

As an engineer
I want to be able to be able to post photos
To display my great work

As an engineer
I want my peers to critically review my work
And to be able to comment on it.

As an engineer
To recieve distinction from my peers
I want them to be able to 'like' my photo

As an engineer
So I can agree with a comment
I would like myself and others to be able to endorse it

As an engineer
I would only like to share my project with colleagues
Therefore there should not be a public front

As a linked-in user
I would like to be able to sign in
without having to remember extra passwords
```

##MVP Roadmap##

MVp1a - User can sign up, sign in and post a photo
MVp1b - User can post a comment to a photo
*Current stage reached*
MVP2 - Comments can be endorsed
MVP3 - Photos appear in chronological order with the newest first
MVP4 - Photos can be filtered to a particular project

##Model Structure##
- User
- Project
- Photo
- Comment
- Like

##Installation##

To run the project
```sh
bundle install
bin/rake db:create
bin/rake db:migrate
bin/rake db:migrate RAILS_ENV=test
```
You will also be required to insert the following file on your local copy at `/config/initializers/dev_environment.rb` with an AWS S3 bucket and account details.
```ruby
unless Rails.env.production?
  ENV['S3_BUCKET_NAME'] = 'xyz
  ENV['AWS_ACCESS_KEY_ID'] = 'xyz'
  ENV['AWS_SECRET_ACCESS_KEY'] = 'xyz'
end
```