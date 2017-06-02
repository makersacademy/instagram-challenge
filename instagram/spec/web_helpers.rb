def sign_up
  visit '/users/sign_up'
  fill_in('Email', :with => 'example@email.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  click_button 'Sign up'
end
