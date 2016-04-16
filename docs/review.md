# Introduction

Welcome to the code review for the Instagram Challenge!  Again, don't worry - you are not expected to have all the answers. The following is a code-review scaffold for Bowling Challenge that you can follow if you want to.  These are common issues to look out for in this challenge - but you may decide to take your own route.

If you can please use this [form](https://docs.google.com/forms/d/1Z-buQVA3Ge6AP7-F9qmaIG687Xh4XazwY3FaqDR3siY/viewform) to tick off where your reviewee has successfully has successfully incorporated these guidelines!  This form helps us get an overall picture of how the whole cohort is doing - it's not an assessment of an individual student.

# Step 0: Checkout and Run tests

Please checkout your reviewee's code and run their tests. Read the code and try and use the app through the web interface.  You can also experiment with the engine in the console. How easy is it to understand the structure of their code? How readable is their code? Did you need to make any cognitive leaps to 'get it'?  Is it more complicated than it needs to be?

# Step 1:  How far did they get?

* Features
  * [ ] Users can post pictures
  * [ ] Users can write comments on pictures
  * [ ] Users can like a picture
  * [ ] Styled awesomely

* Bonus Features
  * [ ] Filters
  * [ ] Deployed to Heroku


# Step 2: Structure and supporting files

## Installation/Usage Instructions in README (+)

As we have seen previously, the README is a great place to show the full story of how your app is used (from a user's perspective).  Include instructions for how to download and run the tests, run the app, e.g.:

```sh
$ git clone git@github.com:[USERNAME]/instagram-challenge.git
$ cd instagram-challenge
$ rake db:setup
$ rspec
```

To run app:

```sh
$ rake db:seed
$ rails s
$ open http://localhost:3000
```

If you created a UI maybe include some screenshots?  For more info on embedding images in a README: https://guides.github.com/features/mastering-markdown/

e.g.:
```
![Screenshot](https://path_to_your_image)
```

You will need to host your images somewhere, e.g.:
* http://imgur.com/
* http://dropbox.com/

## Read Over Your Pull Request Before Submitting

Always leave a space to check over your pull request before submission.  Please try to check for simple issues like:

* indentation
* dead code in comments
* unnecessary files

# Step 3: Tests and \*\_spec.rb files

### General test issues

Try to avoid creating tests with irrelevant expectations or expectations duplicated in other tests, or where test expectations are inconsistent with the test description/requirement.

### Lack of model tests

Do test your models using the thoughtbot [shoulda](https://github.com/thoughtbot/shoulda-matchers) package, e.g.

```ruby
describe User, type: :model do
  it { is_expected.to validate_presence_of :username }
  it { is_expected.to have_many :pictures }
  it { is_expected.to have_many :comments }
end
```

### Prefer Declarative Feature tests

adequate (imperative):

```ruby
scenario 'allows user to leave a comment' do
  sign_up('test@test.com', 'testtest', 'testtest')
  click_link 'Write a comment'
  fill_in 'Thoughts', with: 'Great picture'
  click_button 'Comment'
  expect(page).to have_content 'Great picture'
  expect(current_path).to eq '/posts'
end
```

better (more declarative)

```ruby
scenario 'allows user to leave a comment' do
  sign_up('test@test.com', 'testtest', 'testtest')
  add_comment('Great picture')
  expect(page).to have_content 'Great picture'
  expect(current_path).to eq '/posts'
end

def add_comment(text)
  click_link 'Write a comment'
  fill_in 'Thoughts', with: text
  click_button 'Comment'
end
```

Feature test language should be moved from imperative to more declarative:

http://stackoverflow.com/questions/3466083/imperative-and-declarative-steps-in-rspec

### Feature test precision using 'within'

Should not just check the page has content - should check it is in the right place, but not lock it too tightly to specific CSS/HTML

```ruby
within("comment#photo6") do
  expect(page).to have_content 'Awesome Photo!'
end
```

### Separate out tests where appropriate

So, for example:

```ruby
  context 'there are zero posts' do
    scenario 'should display a message for adding a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts'
      expect(page).to have_link 'Create a post'
    end
  end
```

ought to be:

```ruby
  context 'when there are zero posts' do
    scenario 'display a link to add a post' do
      visit '/posts'
      expect(page).to have_link 'Create a post'
    end

    scenario 'display a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'There are no posts'
    end
  end
```

Favor present tense specs and read http://betterspecs.org

# Step 4: Application code and \*.rb files

## Delete empty helper files

Rails generators can create scaffolds, models, controllers and views, and will generate empty helper files in the process.  Helpers are great for DRYing out your views but should be deleted if not needed.

## Use nested forms where appropriate

acceptable
```ruby  
  # comments_controller.rb
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)

    if @comment.save
      redirect_to pictures_path
      flash[:notice] = "Comment successfully posted"
    else
      render 'new'
    end
  end
```

better

```ruby  
  # in pictures_controller.rb
  def update
    return and render 'update' unless Picture.update(picture_params)
    redirect_to pictures_path
    flash[:notice] = 'Picture successfully posted'
  end
```

```ruby
# model/picture.rb
class Picture < ActiveRecord::Base
  has_many :comments
  accept_nested_attributes_for :comments
end
```

```html
<!-- pictures/edit.html.erb -->
<% form_for @picture do |f| %>
  <%= f.label :image %>
  <%= f.file_field :image %>
  <% f.fields_for :comments do |comments_form| %>
    <%= comments_form.text_field :text %>
  <% end %>
<% end %>
```

## Routing

### Avoid generating unnecessary routes using resources in routes.rb

http://rails-bestpractices.com/posts/2011/08/19/restrict-auto-generated-routes/

## Controllers

### Misplaced logic in your controllers

Business model logic should be in the models, not the controllers. For example:

```ruby
def create
    post = Post.find(params[:post_id])
    comment = Comment.new
    comment.user = current_user
    comment.post = post
    comment.save
    ...
  end
```

Ideally one should create the new comment through the Post association with post.comments.create or post.comments.build. However, as you need to pass the user too, you could write a create_comment(user) method on your Post model.

https://github.com/makersacademy/course/blob/master/rails/extending_associations.md

### No need to set instance vars when redirecting

If you are redirecting, you do not need to set @ variables - you are not accessing those variables on the page, so you can keep the scope restricted to within the create method.

```ruby
def create
  @post = Post.find(params[:post_id])
  @post.comments.create(comments_params)

  redirect_to posts_path
end
```

can be

```ruby
def create
  post = Post.find(params[:post_id])
  post.comments.create(comments_params)

  redirect_to posts_path
end
```

## Models

### avoid duplicated logic

The second line of code below is redundant

```ruby
new_like = @post.likes.create(:user_id => current_user)
new_like.user = current_user
```

### Lack of connection between models

Ensure you use appropriate has_many, has_one and belongs_to associations to associate your models.

## Views

### Differentiating between relative and absolute paths

A relative image link like so:

```html
<img src='Instagram.svg'>
```

causes the browser to look for the image relative to the current url, e.g. if you are running on your local machine, on 'http://localhost:3000/users/sign_in' the above relative link looks for http://localhost:3000/users/Instagram.svg and fails to find the image. If images are in public one should use root relative paths e.g.

```html
<img src='/Instagram.svg'>
```

## The Asset Pipeline and Responsive images

Images should ideally be found in the app/assets/images directory, and best practice would be to add the image via CSS and this would be done as follows:

```css
banner {
  background-image: url("Instagram.svg");
  display: block;
  height: 220px;
  width: 1000px;
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
}
```
and can also be shortened to this:

```css
banner {
  background: url("Instagram.svg") no-repeat center;
  display: block;
  height: 220px;
  width: 1000px;
  background-size: contain;
}
```
which both correspond to a semantic html tag in your application.html.erb of

```html
  <banner></banner>
```
see the following links for more:

* http://www.w3schools.com/css/css_background.asp
* http://www.w3schools.com/cssref/pr_background-image.asp

for more on the asset pipeline see:

* http://guides.rubyonrails.org/asset_pipeline.html

See also:

* http://alistapart.com/article/responsive-images-in-practice

### Use partials appropriately

Simple view components like sign in should be moved into partials and called in from the layout, e.g.

```html
<!-- in layouts/_user_management.html.erb -->
<% unless user_signed_in? %>
  <%= link_to 'Sign in', new_user_session_path %>
  <%= link_to 'Sign up', new_user_registration_path %>
<% end %>

<% if user_signed_in? %>
  <%= link_to 'Sign out', destroy_user_session_path, method: :delete %>
<% end %>
```

```html
<!-- in layouts/application.html.erb -->
<!DOCTYPE html>
<html>
<head>
  <title>InstagramChallenge</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
  <body>
    <render 'user_management'>
    <p class='notice'><%= notice %></p>
    <p class='alert'><%= alert %></p>
    <%= yield %>
  </body>
</html>

```

### Replace instance variable with local variable

```html
<%= render 'form' %>
```

```html
<%= form_for @picture, url: pictures_path, html: {multipart: true} do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>
  <%= f.label :image %>
  <%= f.file_field :image %>
  <%= f.submit %>
<% end %>
```

can be replaced with:


```html
<%= render 'form', picture: @picture %>
```

```html
<%= form_for picture, url: pictures_path, html: {multipart: true} do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>
  <%= f.label :image %>
  <%= f.file_field :image %>
  <%= f.submit %>
<% end %>
```

This is a sensible step because we are encapsulating the set of variables that this partial depends on.  The render operation is now self documenting in that it is describing the set of variables that need to be made available for its use. 

### Law of Demeter Violations

Consider the following view snippet:

```html
<%= comment.user.username %>
```

and associated model code:

```ruby
class Comment < ActiveRecord::Base
  belongs_to :user
end
```

The view is reaching in through the comment model to grab it's associated user, and then calling a method on that. A [Demeter violation](https://en.wikipedia.org/wiki/Law_of_Demeter). We are reaching through the association chain, which we shouldn't be relying on.  We should prefer the following:

```html
<%= comment.username %>
```

and associated model code:

```ruby
class Comment < ActiveRecord::Base
  belongs_to :user
  delegate :username to: :user
end
```

This ensures loose coupling, and allows the comment to change how it manages the username without breaking the associated views.

### Prefer other Semantic HTML Elements to Divs Where Possible

It's tempting to wrap everything HTML5 in a div.  However we should try to make use of other semantic HTML elements where possible.  Try using this [flowchart](http://html5doctor.com/downloads/h5d-sectioning-flowchart.png).  This flowchart should help us choose item 2 from the following list

* 1. Pure Div

```html
<div class='comment'>
</div>
```

* 2. Article (HTML5 recommended)

```html
<article class='comment'>
</article>
```

* 3. Creating your own HTML5 element (avoid unless really required)

```html
<comment>
</comment>
```

Related links:

* http://html5doctor.com/lets-talk-about-semantics/
* http://learn.shayhowe.com/advanced-html-css/semantics-accessibility/ ?
* http://www.w3schools.com/html/html5_semantic_elements.asp

## Avoid anonymous javascript functions

adequate

```javascript
$(document).ready(function() {

  $('.likes-link').on('click', function(event) {
    event.preventDefault();

    var likeCount = $(this).siblings('.likes_count');

    $.post(this.href, function(response) {
      likeCount.text(response.new_like_count);
    })
  })
});
```

better

```javascript
$(document).ready(function() {

  var incrementLike = function(response) {
    likeCount.text(response.new_like_count);
  };

  var handleClick = function(event) {
    event.preventDefault();
    var likeCount = $(this).siblings('.likes_count');
    $.post(this.href, incrementLike);
  }

  $('.likes-link').on('click', handleClick);

});
```
