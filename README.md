Instagram Challenge
===================

**Features**
  * [ ] Users can post pictures

**User stories**

```
As a user,
So that I can show people how amazing my life is,
I want to be able to post pictures on Instagram
```

```
As a user,
So that I can tell people what I think of a picture,
I want to leave a comment on it
```

```
As a user,
So that I can let people know how much I like a picture,
I want to leave a like on it
```

```
As a user,
So that I can make my pictures look better,
I want to use filters on them
```

## Installation/Usage Instructions
```sh
$ git clone git@github.com:MarySalemme/instagram-challenge.git
$ cd instagram-challenge
$ rake db:setup
$ rspec
```
To run app:

```sh
$ rake db:seed
$ rails s
$ open http://localhost:3000/users
```

## Next steps
- Link thumbnails in users/:id/pictures to the specific picture page to see them in full size with the description.
- Implement comments feature
- Implement likes feature
- Beautify the app
- Implement filters
