def sign_up(email, password, password_confirmation)
  visit 'users/sign_up'
  fill_in "user[email]", :with => email
  fill_in 'user[password]' ,:with => password
  fill_in "user[password_confirmation]", :with => password_confirmation
  click_button "Sign up"
end

def log_in(email, password)
  visit 'users/sign_in'
  fill_in "Email", :with => email
  fill_in 'Password', :with => password
  click_button "Log in"
end

def create_post(url,desc)
  click_link 'New post'
  attach_file('Image', url)
  fill_in 'Description', with: desc
  click_button 'Create Post'
end
