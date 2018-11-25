# frozen_string_literal: true

def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'Name', with: 'Caitlin Cooling'
  fill_in 'Email', with: 'caitlin@test.com'
  fill_in 'Password', with: 'caitlin123'
  fill_in 'user_password_confirmation', with: 'caitlin123'
  click_button 'Sign up'
end
