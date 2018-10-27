# frozen_string_literal: true

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'username',      with: 'testusername'
  fill_in 'user_email',    with: 'test@test.com'
  fill_in 'User_password', with: 'testpassword'
  click_button 'Sign up'
end
