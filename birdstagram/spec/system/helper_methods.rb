def sign_up
  visit '/users/new'
  fill_in 'user_username', with: 'rio'
  fill_in 'user_password', with: 'bells'
  fill_in 'user_email', with: 'rio@example.com'
  click_button 'Sign Up'
end 
