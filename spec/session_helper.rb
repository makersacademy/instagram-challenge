def sign_up(email: 'betty@gmail.com')
  visit '/posts'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end
