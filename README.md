Instagram Challenge
===================

Spent quite a long time researching how to send images via API. I am now wondering if actually it's better if images are *not* sent via API for any reason (a small google search didn't seem to bring up any significant opinions / thoughts on this)...

Current user? Fresh api or returned with current apis? Or taken from username of logged in user printed on top of page? What is the safest way to do this?

When a new post is created, is it best to append this to the div as an individual post as opposed to re-running the getAllPosts API request? I imagine it is best in terms of speed but this means more written code which can lead to a greater possibility of more bugs?

To clear images from test database:
https://edgeguides.rubyonrails.org/active_storage_overview.html#discarding-files-stored-during-system-tests
<!-- <div class="posts">
  <%# @posts.each do |post| %>
    <div class="each-post">
      <div class="post-details">
        <h4 class="post-username"><%#= post.user.username %></h4>
        <h5 class="post-timestamp"><%#= post.created_at.strftime("%H:%M %-d %B %Y")%></h5>
      </div>
      <div class="image">
        <%# if post.image.attached? %>
          <%#= image_tag post.image.variant(resize_to_fit: [210, 180]) %>
        <%# else %>
          <p>no picture this time!</p>
        <%# end %>
      </div>
      <div class="post-caption">
        <p><%#= post.caption %></p>
      </div>
      <div class="edit-del-links">
        <%# if post.user == current_user %>
          <%#= link_to 'Edit', edit_post_path(post.id) %>
          <%#= link_to 'Delete', post_path(post.id), method: "delete" %>
        <%# end %>
      </div>
    </div>
  <% end %>
</div> -->
Very open but I wrote down user stories and it seemed more doable.

I learned about Devise for user authentication - it took a while to figure out but I like it a lot - ultimately will make life easier!

-----------------
Now trying to set up an API for getting posts & creating posts. Using [this blog](https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one) to help.

Testing Lessons:
User module FeatureSpecHelper and include it in rails_helper to use across feature tests
Use factory bot to populate table data (eg create users and posts. I'm using it to test the api.)

## Instructions

* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!
