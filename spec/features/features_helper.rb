def signup
  visit '/'
  click_link "Register"
  fill_in 'Email', with: 'testmail@gmail.com'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'
  fill_in 'User name', with: 'Alessandro'
  click_button 'Sign up'
end 

def signin
    visit '/'
    fill_in "Email", with: 'testmail@gmail.com' 
    fill_in "Password", with: 'password'
    click_button "Log in"
end 

