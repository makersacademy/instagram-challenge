def sign_up_user
  visit '/users/new'
  fill_in 'user_name', with: 'test'
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: '123'
  fill_in 'user_password_confirmation', with: '123'
  click_button 'Sign Up'
end

def sign_in_user
  visit '/signin'
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: '123'
  click_button 'Sign In'
end
