def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_name', with: 'Real User'
  fill_in 'user_email', with: 'realemail@example.com'
  fill_in 'user_password', with: 'secret123'
  fill_in 'user_password_confirmation', with: 'secret123'
  click_button 'Sign up!'
  expect(page).to have_content 'Current User Count: 1'
  expect(page).to have_content 'Welcome to Instagram Real User you are now signed up!'
  expect(current_path).to eq root_path
end
