def user_sign_up
  visit "/"
  click_link "Sign up"
  fill_in "user[name]", with: "Kim"
  fill_in "user[email]", with: "kim@kim.com"
  fill_in "user[username]", with: "kim_morgan"
  fill_in "user[password]", with: "password"
  fill_in "user[password_confirmation]", with: "password"
  click_button "Create User"
end

def log_in
  visit("/")
  click_link "Log in"
  fill_in "session[email]", with: "kim@kim.com"
  fill_in "session[password]", with: "password"
  click_button "Log in"
end

def create_post
  click_link "New post"
  fill_in "post[caption]", with: "My breakfast"
  page.attach_file(Rails.root + 'spec/test_pics/food_pic.jpeg')
  click_button "Create Post"
end