def sign_up
  visit('/users/sign_up')
  fill_in 'user_username', with: "testing"
  fill_in 'user_email', with: 'user@test.com'
  fill_in 'user_password', with: 'testing'
  fill_in 'user_password_confirmation', with: 'testing'
  fill_in 'user_bio', with: "Test bio"
  click_button 'Sign up'
end
