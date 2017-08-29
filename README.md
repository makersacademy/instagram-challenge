
## Instagram Mock ##

A rails-based rebuild of Instagram. This web app has the following functionality.
Unregistered users can search for and view users' photos. Registered users can sign-in and -out, add photos and comments (edit and delete these resources, also), and filter photos by tag.

## Run ##

Steps to run the app:

```
$ git clone git@github.com:jkingharman/instagram-challenge
$ cd instagram
$ bundle
$ rails server
Visit your assigned local host in the browser
```

## Test ##

```
$ rspec
```

## Major Dependencies ##

* Paperclip so that users can work with photos.
* AWS so that photos are stored on the cloud.
* Devise so that users can sign-in and out.

## Example Screenshot ##
