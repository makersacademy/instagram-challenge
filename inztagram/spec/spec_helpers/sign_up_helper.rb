def sign_up
  visit '/sign_up'
  fill_in 'user[first_name]', with: 'Joe'
  fill_in 'user[last_name]', with: 'Bloggs'
  fill_in 'user[email]', with: 'joebloggs@test.com'
  fill_in 'user[password]', with: 'password'
  fill_in 'user[password_confirmation]', with: 'password'
  click_button 'Create Account'
end