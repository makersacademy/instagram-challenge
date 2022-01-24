# Instagram Challenge

Build your own Instagram.

User stories:

_As an authenticated user
I can view posts of other users_

_As an authenticated user
I can create new posts with a photo and a description_

_As an authenticated user
I can logout_

_As an unauthenticated user
I can sign up with username, email and password_

_As an unauthenticated user
I can login with email and password_

## Built with

- [Ruby On Rails]()

## Getting Started

### Installation

1. Clone the repo

```
  git clone https://github.com/Riky5/instagram-challenge
```

2. Install gems

```
  bundle install
```

3. Database Setup

```
  rails db:migrate
```

4. Start the server

```
  rails server
```

5. Open a browser and type in the url

```
  localhost:3000
```

---

**Landing page/Login page:**

![Login](/app/assets/images/landing_page_login_1.png)

**Sign-Up page:**

![Sign Up](/app/assets/images/registration_page_2.png)

Once signed up

**Main page:**

![Rails-post-page](/app/assets/images/main_page_3.png)

In the image you see I had created a previous user and already posted a photo

**Create new post page:**

If you click on the plus icon on the navbar you're redirected to the "create new post" page

![New post](/app/assets/images/new_post_page_4.png)

Example: adding an image and description

![Creating new post](/app/assets/images/writing_new_post_5.png)

Example: the new post is added

![New post added](/app/assets/images/new_post_added_6.png)

This is how it looks on mobile screen

![Responsive](/app/assets/images/responsive_on_mobile_7.png)

You can logout by clicking on the exit icon on the navbar

![Can logout](/app/assets/images/signed_out_8.png)

---

NOTES: I haven't spent much time adding tests, I focused more on the UI 😅 and creating the basics.