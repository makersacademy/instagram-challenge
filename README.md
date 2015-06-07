Instagram Challenge
===================

[![Build Status](https://travis-ci.org/armi1189/instagram-challenge.svg?branch=master)](https://travis-ci.org/armi1189/instagram-challenge) [![Coverage Status](https://coveralls.io/repos/armi1189/instagram-challenge/badge.svg)](https://coveralls.io/r/armi1189/instagram-challenge) [![Code Climate](https://codeclimate.com/github/armi1189/instagram-challenge/badges/gpa.svg)](https://codeclimate.com/github/armi1189/instagram-challenge)
-------
What is it?
-------
This is an attempt to clone Instagram concept done it as a challenge for Makers Accademy. The concept is very basic, a user can sign up and log in, and after that he can upload his own pictures to the websites. In addition a user can also comment and like other people pictures.  

###[Try it on Heroku!](https://secure-reaches-2288.herokuapp.com)
![InstagApp Home](https://github.com/armi1189/instagram-challenge/blob/master/public/img/inst1.jpg)
-------

Tools
-----
**Testing:** RSpec, Capybara  
**Develop:** Rails, HTML, CSS  
**Gems:** Devise, OAuth, Paperclip, AWS, Bootstrap-Rails

Some Features
-----
###### User authentication and Facebook Login  
For user authentication I've decided to use [Devise](https://github.com/plataformatec/devise) a very useful rails gem that creates all the settings for a basic login system.  
Since Devise, by default, allows users to sign up and login only with their email, I wanted also to add the possibility to signup and login trough a unique username. Thank to Devise documentation ([this guide](https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address) in particular) it was very easy to accomplish this.

Trough the OAuth gem, in addition, is possible to log in with your Facebook account.

`models/user.rb`
```
devise omniauth_providers: [:facebook]
...
...
def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.username = auth.info.name
  end
end
```

--
###### Pictures upload and storage  
For picture upload and storage i've used [Paperclip](https://github.com/thoughtbot/paperclip) gem combined with [Amazon Web Services](http://aws.amazon.com/) trough another gem: [aws-sdk](https://github.com/aws/aws-sdk-ruby).

Just configuring AWS secret keys and adding the following snippet to `models/post.rb` is now possible to upload images in our website.
```
has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "250x250>" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
```

--
###### Comments & Likes  
One of the most challenging part was to create comments and likes trough user. In order to accomplish that I had to create a method that actually builds the record associated to the user.

`models/with_user_association_extension.rb`
```
def build_with_user(attributes = {}, user)
  attributes[:user] ||= user
  build(attributes)
end
```

After that i had only to call the method in my `controllers/comments_controller.rb`

```
def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.build_with_user(comment_params, current_user)
...
```

Same procedure for `controllers/likes_controller.rb`

```
@like = @post.likes.build_with_user(current_user)
```
--
###### Profile Pages  
At the end I've decided to add a small and simple feature that allows every user to have his own personal page with only the pictures that he had upload.   
In order to do this I've created a new route in `config/routes.rb` 
```
get '/users/:id' => 'users#show', :as => 'user'
```  
And I've created a show method inside `users_controller.rb`
```
def show
  @user = User.find(params[:id])
end
```
