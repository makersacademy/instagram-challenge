# Instagram Challenge
## aka V A P O R G R A M
```
 __  __     __     _____     ___   _ __    __   _ __    __      ___ ___    
/\ \/\ \  /'__`\  /\ '__`\  / __`\/\`'__\/'_ `\/\`'__\/'__`\  /' __` __`\  
\ \ \_/ |/\ \L\.\_\ \ \L\ \/\ \L\ \ \ \//\ \L\ \ \ \//\ \L\.\_/\ \/\ \/\ \ 
 \ \___/ \ \__/.\_\\ \ ,__/\ \____/\ \_\\ \____ \ \_\\ \__/.\_\ \_\ \_\ \_\
  \/__/   \/__/\/_/ \ \ \/  \/___/  \/_/ \/___L\ \/_/ \/__/\/_/\/_/\/_/\/_/
                     \ \_\                 /\____/                         
                      \/_/                 \_/__/     
                      
            the sound of shining optimism that's faded over time﻿
```                      
                      
### What it is

An attempt to recreate Instagram using Ruby on Rails, except it burns your retinas.

### How Can I Use This 

Clone this repository to your local machine and navigate to it via the command line.

``` bundle install ```
``` rails s ```

Then visit localhost:3000/users/new in your browser!


### My approach

I spent a lot of my first day of this trying to get Rails set up with all the appropriate gems. After a few false starts, I decided to go with making the User model first, and got a login/signup/encrypted password situation going. I also started playing around with SASS very early on as I took recreational styling breaks pretty much every time I committed.

![Early Vaporgram](https://github.com/wemmm/instagram-challenge/blob/master/app/assets/images/vaporgram1.png)

The above shows the first semi presentable version, with no functions other than signing up and logging in. I also added a log out functionality because probably nobody wants to be logged in permanently, then I started to add the Post model. 

I found the Post model a lot harder to work with for a few reasons: firstly, it depended on the User model and secondly I was using sqlite3 rather than my usual postgresql. After an extremely long time spent trying to get posts added to the database, I then had to make sure that the carrierwave gem was installed properly, and eventually figured out how to get pictures to appear.

![Mid Vaporgram](https://github.com/wemmm/instagram-challenge/blob/master/app/assets/images/vaporgram2.png)

Then I made it look even worse.

![Late Vaporgram](https://github.com/wemmm/instagram-challenge/blob/master/app/assets/images/vaporgram3.png)

### TODO

- I did not manage to implement likes, comments or filters. This is something I would like to look at in future, especially the filters as I've not implemented anything like that before. 

- Controller tests.

- I would like to add show routes for posts and users (basically a comments page and a user profile).

- I am quite happy with my progress on this one! It's pretty solid so I think extending the code to add some or all of these features is pretty doable.

### Do I Understand Rails?

Much, much better than I did two days ago.

### User Stories

Here are the user stories I generated before starting work on the project:

```
As a user,
so that I can share my photos with the strangers of the internet,
I would like to be able to upload and display a photo.
```

```
As a user,
So that I can look at other users' photos,
I would like to be able to see a feed of uploaded images.
```

```
As a user,
So that I can post photos and comments as me,
I would like to be able to sign up for an account.
```

```
As a user,
So that I can impose my opinions on a wide audience,
I would like to be able to comment on photos.
```

```
As a user,
So that I do not have to actually type to signal my approval,
I would like to be able to 'like' a photo.
```

```
As a user with excellent taste,
So that I can enjoy a brightly coloured and fancy experience,
I would like to use an exquisitely styled website.
```

```
As a whimsical user,
So that my photos are less reflective of reality,
I would like the choice to add a filter to my photos.
```

### Known Issues 

- Questionable a e s t h e t i c 
- Currently incompatible with Heroku due to sqlite3
- CSS is a bit glitchy but perhaps that is a feature?

