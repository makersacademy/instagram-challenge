# Instagram Challenge
A clone of the popular social media app Instagram.

## User Stories
```
As a user,
So I can stay connected with the world
I can see other people's pictures.

As a user
So I can show my friends my photos
I can upload my own pictures.

As a user
So I can grace other people with my wit and wisdom
I can comment on pictures

As a user
So I can show support for good photos
I can 'like' photos

As a user
So that I get proper credit
My photos are attributed to me.
```
## MVP
* New photos can be added from the browser by uploading a photo.
* All photos are viewable on the `/photos` route.
* Photos can be clicked on to view them larger.

## Tasks
|Task|Acceptance Criteria|Time Allocated|Progress|Time Taken|
|---|---|---|:-:|---|
|Create process document|A markdown document is in the repo with user stories, MVP and task breakdown|30 mins|✅|30 mins   |
|Generate new Rails project and set up.|Can view 'hello world' page. Rubocop is running. .gitignore file is setup.|30 mins|
|Set up photo resource including routes and database|Database exists and photos can be added to the database via the terminal. Routes are set up and can be viewed via `rails routes`|1 hour|
|Photos can be viewed via the browser.|The `/photos` route displays thumbnails of all currently uploaded photos.|30 mins
|Photos can be uploaded via the browser.|A form is viewable at the `/photos/new` route, where you can upload a photo. This photo is stored in the database, and can be viewed at the `/photos` route.|1 hour|
