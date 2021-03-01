def sign_in
  visit '/sign_in'
  fill_in 'email', with: 'joebloggs@test.com'
  fill_in 'password', with: 'password'
  click_button 'Log in'
end