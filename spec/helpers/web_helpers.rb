# frozen_string_literal: true

def sign_up
  visit '/users/sign_in'
  click_link 'Sign up'
  fill_in 'Username',              with: 'testusername'
  fill_in 'user_email',            with: 'test@test.com'
  fill_in 'Password',              with: 'testpassword'
  fill_in 'Password confirmation', with: 'testpassword'
  click_button 'Sign up'
end
