#Instagram Clone - Makers Weekend Challenge

## Status
1. Users can sign up, in and out.
2. Users can post and delete images with captions.
3. Users can like and comment on posts.
4. Following and Follower stats displayed in the users profile page.

### Work in progress
1. Underlying model built to follow and unfollow users, but not yet implemented.
2. Styling unfinished
3. AWS to host photos
4. Implementation of bootstrap and custom css has broken tests!
5. Ajax and javascript to update likes without refresh.

## Installation

```sh
$ git clone git@github.com:hannako/instagram-challenge.git
$ cd instagram-challenge
$ rake db:setup
$ rspec
```

To run app:

```sh
$ rake db:seed
$ rails s
$ open http://localhost:3000
```


`
