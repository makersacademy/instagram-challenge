def sign_up
  visit '/users'
  click_on 'Sign up', match: :first
  fill_in :user_email, with: 'test@test.com'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Sign up'
end
