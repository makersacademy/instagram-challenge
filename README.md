Instagram Challenge
===================

Overview
-------
This is a very basic clone of Instagram. User will be able to sign in, sign out, add pictures to their profile, view all the pictures in their feed, add likes, comments and tags.

## Installation

In your terminal do the following

```bash
git clone https://github.com/dbatten4/instagram-challenge.git
cd instagram-challenge
bundle install
bin/rake db:create
bin/rake db:migrate
rails s
```

Visit localhost:3000

## Testing

Run Rspec

```sh
rspec
```
