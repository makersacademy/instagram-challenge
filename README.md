# Instagram Challenge

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## User Stories

I extracted user stories from the short brief above.

### Authentication

- [x] 1.1

> As a Potential User  
> I can sign up for an account  
> So that I can post my own photos

- [x] 1.2

> As a User with an existing account  
> I can sign in to my account  
> So that I can post photos and make comments as me

- [x] 1.3

> As a Signed In User  
> I can sign out of my account  
> So that I can prevent people posting as me

### Posting

- [x] 2.1

> As a Signed In User  
> I can post a photo  
> So everyone can see what I'm doing

- [ ] 2.2

> As a Signed In User  
> I can choose from several filters and apply them to my photo  
> So I can express my artistic side

- [ ] 2.3

> As a Signed In User  
> I can change the filter on my photo  
> In case I don't like that filter any more

- [ ] 2.4

> As a Signed In User  
> I can delete my photos  
> So I can erase embarrassing memories

- [ ] 2.5

> As a User  
> I can see a feed of photos, newest to oldest  
> So I can see what is going on with everyone recently

### Commenting

- [ ] 3.1

> As a Signed In User  
> I can comment on a photo  
> So I can that user them what I think of it

- [ ] 3.2

> As a Signed In User  
> I can edit a comment I have made  
> So I can correct spelling errors

- [ ] 3.3

> As a Signed In User  
> I can delete a comment I have made  
> So I can erase embarrassing things I have said

- [ ] 3.4

> As a User  
> I can see all comments on a photo from newest to oldest  
> So I can see the freshest opinions on my photo

- [ ] 3.5

> As a User  
> I can see the username of who made a comment  
> So I can tell who is interacting with me

- [ ] 3.6

> As a User  
> I can see the time a comment was made  
> So I can understand how quickly people commented

### Liking

- [ ] 4.1

> As a Signed In User  
> I can like a photo  
> So I can show appreciation without commenting

- [ ] 4.2

> As a Signed In User  
> I rescind a like  
> In case I change my mind about liking that photo

- [ ] 4.3

> As a User  
> I can see how many likes a photo has  
> So I can estimate my popularity

### Style

- [ ] 5.1

> As a Potential User  
> So that I am enticed to join  
> The site should be well styled

## Domain Modelling

Based on the user stories I wrote some CRC cards, and made table schema:

![CRC Cards and Table Schema](images/insta-clone-crc-table-schema.png)

## Development Journal

### Initialising Rails

This project may eventually be deployed to Heroku, so I will initialise it with a Postgresql database, in this repo:

```shell
rails new . --database=postgresql
```

Next I added rspec-rails to the development and test groups in the Gemfile, bundled, and installed with:

```shell
rails generate rspec:install
```

I also added simplecov, and simplecov-console to check code coverage, and Rubocop for linting.

### User Sign Up

- [x] 1.1

> As a Potential User  
> I can sign up for an account  
> So that I can post my own photos

These first three user stories are all related to authentication. This is perhaps a bigger challenge to start with, but it is so linked to ultimate form of many other user stories, that I feel it will be good to get out of the way early.

Feature test: User signs up through users/new form and sees their username. (Happy Path). Red.

- Generated a users controller with new and create routes with `rails g controller users`.
- Generated a User model according to the schema with `rails g model user username:string{20}:uniq name:string{60} email:string{60}:uniq password_digest:string`.
- Migrated the database with `db:migrate`.
- Added a form with scope for the user, posting to the `users_path` (which will go to create by default).
- Added to the routes config a resource for users, allowing only new and create
- Added a user create route. It renders the `params` for now.
- Added bcrypt to the Gemfile.
- Added `has_secure_password` helper method to User model. (this causes the `User.create` method to encrypt password with bcrypt).
- In the user create route, created a user with `User.create`, passing in `user_params`.
- `user_params` is a method that returns the permitted user parameters.
- The users id is added to the `session` and the route redirects to '/'.
- Added a sessions controller with `rails g controller sessions` (this controller will provide routes for the existing user log in page, as well as the welcome page).
- Added index route to sessions, and added this as the root in routes config.
- Added a couple of helper methods to the application controller: `current_user`, which finds returns a user based on the `session` user id, and `logged_in?`, which returns true if the `current_user` is not nil.
- Both of these helper methods are exposed using the `helper_method` method.
- In the sessions/index view added some executive ruby to render "Hello `username`" if logged in.

Test green.

Feature test: User signs up through users/new form, tries existing username, and sees error. (Unhappy Path). Red.

- Added to User model that it validates username as unique.
- Refactored user create route to use `User.new` instead of `User.create`.
- Then if `@user.save` is true (i.e. it was able to be written, and no errors with unique username), assign id to `session` and redirect to '/'
- else assign `@errors` with `@user.errors` and render 'new'.
- Added to users new view executive ruby for if `@error` render a h2 element with This username or email already in use.

Green.

Feature test: User signs up through users/new form, tries existing email, and sees error. (Unhappy Path). Red.

- Added to User model validation for email uniqueness.

Green.

### User Log In

- [x] 1.2

> As a User with an existing account  
> I can sign in to my account  
> So that I can post photos and make comments as me

Feature test: User logs in through sessions/new form, correct password, and sees their username. (Happy Path). Red.

- Added a form to sessions/new view with scope for user, posting to `sessions_path` which will go to sessions create.
- Added sessions create route.
- Found the user by username.
- Added the user id to `session`.
- redirected to '/'.

Green.

Feature test: User logs in through sessions/new form, WRONG password, and sees error. (Unhappy Path). Red.

- In sessions create route, added an if authenticating the user with `@user.authenticate(user_params[:password])` returns true, assign user id to `session` and redirect to '/'.
- else `@error` is true, and render 'new'
- Added executive ruby, if `@error` render a h2 element with "Incorrect username or password".

Green.

Feature test: User logs in through sessions/new form, WRONG username, and sees error. (Unhappy Path). Red.

- In sessions create, added `@user` to the if statement, to check if the user was actually found.

Green.

### User Log Out

- [x] 1.3

> As a Signed In User  
> I can sign out of my account  
> So that I can prevent people posting as me

Feature test: User is logged in, then clicks log out button, no longer sees their username. Red.

- Added to the sessions controller a route for destroy.
- On sessions index view added a button to sessions with method of delete.
- In routes config, switched sessions to `resources` to `resource` (to allow deletion without specifying an id, there is only ever one session).
- Added destroy route to sessions controller, clearing the `session` and redirecting to '/'.

Green.

Refactoring:

- Cleaned up excess routes by specifying only sessions index, new, create, destroy.
- Switched to using `root_path` instead of redirecting to '/'.

### Making a Post

- [x] 2.1

> As a Signed In User  
> I can post a photo  
> So everyone can see what I'm doing

Feature test: User can make a post. Red.

- Generated post model with `rails g model post filter:string user:references`.
- Generated posts controller with `rails g controller posts`.
- Added to User model, has many posts.
- Added posts resources nested within user resources in routes config.
- Added button to root view to make new post, going to the new user post path, passing in the current user.
- Added route for new posts.
- Added view for new posts, with form to build a post for current user.
- Added a route to create post, creating a post on the current user with the params from the form, redirecting to root_path.
- Added executive ruby to the sessions index view if the user is logged in, to loop through their posts and render them.

Green.
<!--

### Adding Filters

- [ ] 2.2

> As a Signed In User  
> I can choose from several filters and apply them to my photo  
> So I can express my artistic side

### Editing Post Filter

- [ ] 2.3

> As a Signed In User  
> I can change the filter on my photo  
> In case I don't like that filter any more

### Deleting Posts

- [ ] 2.4

> As a Signed In User  
> I can delete my photos  
> So I can erase embarrassing memories

### Listing Posts

- [ ] 2.5

> As a User  
> I can see a feed of photos, newest to oldest  
> So I can see what is going on with everyone recently
