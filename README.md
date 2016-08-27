Instagram Challenge
===================

- Challenge time
  - 2 days (weekend)
- Challenge requirements
  - Ruby on Rails
- Development practices used
  - TDD
  - Agile


User stories
```
As a user,
So I can use SquareGram services,
I would like to Sign up to the website in multiple ways.

As a user,
So I can share my photos with other users,
I would like to be able to post a photo to my feed.

As a user,
So I can have more control over my photos,
I would like to be able to edit description and/or delete photos.

As a user,
So I can appreciate other people's photos,
I would like to be able to 'Like' them.

As a user,
So I can better appreciate other people's photos,
I would like to be able to post comments.

As a user,
So I can be updated with photos from my favourite users,
I would like to be able to follow users and see their posts on my feed.
```

* `Feed` model as a resource to hold particular user's feeds.
  * `#show` shows an individual user's feed (his/her photos only)
  * `#index` shows your personal feed joined by the feeds of every user you follow.
* As usual, `Photo` model deals with individual photos, and they belong to a user and a particular feed.
* `Users` have many photos and one (1) feed. Feeds cannot be edited or deleted by hand. Only shown.
* `Likes` belong to a `Photo` and they're unique within the scope of a `User`
