def signup
  visit root_path
  click_link 'Sign up'
  fill_in 'Email', with: "alex@mail.com"
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end