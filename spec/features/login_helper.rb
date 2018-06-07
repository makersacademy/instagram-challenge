def sign_up(email, user_name)
  visit '/'
  click_link 'Sign up'
  fill_in "user[user_name]", with: user_name
  fill_in 'Email', with: email
  fill_in "user[password]", with: 'killtheromans'
  fill_in "user[password_confirmation]", with: 'killtheromans'
  click_button 'Sign up'
end
