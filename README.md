Instagram Challenge
===================
So, I didn't have much time this weekend. However, I did at least get a bit done! Users can sign up, login and post photos. Posts are displayed on the screen. Users can comment on posts and they are displayed on the individual post's page.
I did some testing, but not enough. You can't edit or delete posts.
I didn't use strong params appropriately because I couldn't quickly get it to work so I bodged it. A walkthrough of how to fix this would be super helpful!
The styling is super basic - it looks horrific.
Images are saved to localstorage, but with more time I'd use a cloud-based storage system.

## Instructions for use:

* clone the repo
* cd birdstagram
* bundle
* bin/rails db:create, db:migrate
* bin/rails server
