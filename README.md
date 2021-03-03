# README

## What I did

### Setup

```
1) First created the rails files by using rails new **file name**

2) Folders that we will frequently use are: apps (assets, controllers, models, views), config (routes), db(migrate and schema)

3) Then created a home page and you can generate all the relevant files by using rails generate controller home index (this creates a controller,route, view, web page, test file and ruby file)
4) Changed the routes in the config file

5) run rails s to view the server

6) The page you created when you ran generate is within apps --> views -->home --> index.html

7) Can change the root of our index within the routes file e.g. root 'home#index' (foldername#filename)
8) Rails routes checks all the routes within the project

9) Within apps --> views --> layouts --> applications html displays all of our web pages and they are all linked through here. This happens through the <%yield%>

10) We can add styles through this page and it will happen on all pages
```

### Bootstrap

```
11) Then added bootstrap into my file by going on bootstrap.com, found the latest version to copy the template on, put this on the apps page. After this you match the code you have previously to put within this boot strap. yield where H1 is, Title replaces new tile and the copy the rest of the old code and paste below the head of the boot strap. Can then delete the old bootstrap.

12) To create a partial - create a file within the home folder and call this _header.html.erb

13) On the app html page within the body put <%= render "home/header %>, the page is able to pick up the header without the _ because render means it's looking for a partial file.

14) The header file is now linked and means you can type anything in the header file and it will be displayed through the app html.

15) To add a navbar go onto Bootstrap.com --> components --> navbar, copy the navbar that looks good, past the code within the header file. This navbar will now be shown on your web page and all other web pages linked. (can edit the navbar slightly within the header page e.g. change from light to dark, change the name too)

16) Can delete dropdowns by going within the header file and delete the indvidual li with code inside it too.
```

### Links

```
17) To create a link so that the buttons work on the navbar:
Within the header file - type in <%= link_to"WhateverYouWant"%>, foldername_filename_path (or root_path if it's the home page), class="whateverYouAreReplacingInTheLi". e.g. <%= link_to"Picture, root_path, class=nav-link>


18) rails routes shows you all your routes and shows the prefixes which can be used in the previous step
```

### Creating a scaffold (including attaching photos) - CRUD

```
19) To create the crud principals we can use something called scaffold. This will allow us to create, read, update and destroy. This can put information within a table.

20) run rails g scaffold picture first_name:string last_name:string email:string etc

21) This creates a lot of files, within the controller, db, htmls etc and are all linked to our other pages.  In the db files we can see the tables created.

22) rails db:migrate will actually make all of this go live and will create the database properly. In the example on step 20 we could visit localhost:3000/picture and we'd see the crud principals that we've created.

23) To add images I first needed to install something called active storage, it allows you to attach files to active record objects. rails active_storage:install. Then as always ran dn:migrate. This creates the two tables in the schema

24) Then add has_one_attached :image to the picture model. This allows you to attach a single image to the model.

25) Changed the pictures_controller page to reflect that the image is being passed within the params. After this the picture should allow you to attach photos.

26) Then added this within the view to display the image text box using image_tag and added it to the table.

27) Added within a div <% if picture.image.attached?%>
    <%= image_tag picture.image, style: "width: 200px; display:block" %>
    <% end %>

    <%= form.label :image %>
    <%= form.file_field :image%>
    within the _form file to be able to attach photos to the form.

28) updated navbar to reflect us being able to add a photo
```

### Back to bootstrap

```
29) I then worked on some bootstrap to make the page look nicer. First go to app --> views --> picture (where all your table info was made in the previous steps). And also go to bootstrap.com --> components --> table. This will make our 'picture table' look nicer.

30) Within the index file you can change the <table> to class = "table", then add some things from bootstrap that you can find easily and put this within the class. Can see the changes on the website live.

31) Similar with buttons, bootstrap.com --> components --> buttons --> take an example of the button. At the bottom of the index page wher you can see the link to other pages, after the link you can add the class of a button and if you then visit the website you can see the button has been displayed in a much better way

32) Forms again is similar except bootstrap.com --> forms.
To make the changes do this within the picture --> _forms file. An example of a change that I made is:
I changed the class to mb-3 and added the class: "form-control" too.
See below:
<div class="mb-3">
    <%= form.label :twitter %>
    <%= form.text_field :twitter, class: "form-control" %>

33) Put the placeholder within the message (changed the form class  to have placeholder). e.g. ,placeholder: "username"

34) May have to delete the other notice alerts on the other pages for it not to be shown twice
```

### Devise (user sign up etc)

```
35) Add a gem file called gem devise then run bundle install

36) Used rails g devise:install

37) Worked through the steps given on the terminal, important to be able to carry on. On step two they add a URL to the dev, may need to do this to production as well

38) Then ran rails g devise user

39) rails db:migrate to migrate the tables and databases and make them live

40) In rails routes we can now check the new routes/paths that have been created

41) To add the links on the navbar go to the apps --> home --> header page, create more in there using the li's. Make sure to use the path prefixes found in in the rails routes to create the new routes. All easy except on the user sign out one you'll need to add ,method: :delete after the class for signing out to work.

42) Then added an if statement to this page where the user can only see certain buttons on the navbar if they are signed in. Did this using <% if user_signed_in?>
with the links related. Then <% else %> other links. Then <%end %>
```

### Creating associations so that only users who posted the picture are able to edit/delete their own posts

```
43) Added an authenticate user to the pictures controller page and passed in the user id within the pictures param.

44) Assigned it so that the pictures belong to the user and that a user can have many photos

45) Within the form added the user ID to be assigned to the picture post and for this to be hidden so that it's not displayed to the user.

46) And within the views added an If statement so that a user is only able to see the actual buttons of Edit/Delet if they are signed in.

47) Altered on my view as well to be able to see the ID on the index page (not needed)
```

### Liking, unliking, adding a button and extra css

```
48. To add a like feature needed to run rails g model Like picture:references user:references, then db migrate.

49. Then ran rails g controller likes

50. The steps I took were very similar to what is on https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2. Just slightly adjusted to fit my criteria.

51. I then changed the button to be different icon so that it would turn into an icon when liked and then go back to the original when you click it again. This was through css style sheet and adjusting the button on the index page.

52. Added some styling within the controller page so that it looked slightly more user friendly.
```
