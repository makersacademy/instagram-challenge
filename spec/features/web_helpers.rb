# Makes a new user and takes them to the index of the app
def new_user
  visit "/posts"
  click_link('Sign Up')
  fill_in 'user_name', with: 'Jade'
  fill_in 'user_email', with: 'jade@jade.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Submit'
end

# Makes a new user account and logs out, returns to index of app
def new_logged_out_user
  visit "/posts"
  click_link('Sign Up')
  fill_in 'user_name', with: 'Jade'
  fill_in 'user_email', with: 'jade@jade.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Submit'
  click_link 'Log Out'
end
