def log_in(email = 'test@ymail.com', password = 'supersecret')
  visit '/'
  fill_in "user[email]", with: email
  fill_in "user[password]", with: password
  click_button "Log in"
end

def sign_up(email = 'test@ymail.com', username = "user.second", password = 'supersecret', password_confirmation = 'supersecret')
  visit '/'
  click_link "Sign up"
  fill_in "user[email]", with: email
  fill_in "user[name]", with: username
  fill_in "user[password]", with: password
  fill_in "user[password_confirmation]", with: password
  click_button "Sign up"
end

def post_picture(comment = "")
  click_link "Post Picture"
  attach_file 'image_image', 'spec/fixtures/files/test.png'
  fill_in "Comment", with: comment
  click_button "Create Image" 
end