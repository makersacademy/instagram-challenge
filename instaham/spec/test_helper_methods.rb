def sign_up
  visit('/users/sign_up')
  fill_in('user_email', :with => 'tester@test.com')
  fill_in('user_password', :with => 'testing123')
  fill_in('user_password_confirmation', :with => 'testing123')
  click_button('Sign up')  
end
