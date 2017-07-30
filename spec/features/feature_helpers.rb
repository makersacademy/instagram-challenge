def sign_up(name: "Mimi", email: "Mimi@fake.com",  password: "password", password_confirmation: "password")
  fill_in(:user_name, with: name)
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  fill_in(:user_password_confirmation, with: password_confirmation)
  click_button('Sign up')
end

def log_in(email: "Mimi@fake.com",  password: "password")
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  click_button('Log in')
end

def add_post(post_title: "first post", post_link: "http://i.imgur.com/0tJPjzf.jpg")
  fill_in(:post_title, with: post_title)
  fill_in(:post_link, with: post_link)
  click_button('Create Post')
end

def sign_up_and_add_post
  visit "/"
  click_link "Sign up"
  sign_up
  click_link('Add a post')
  add_post
end
