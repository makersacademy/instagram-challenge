def sign_up
  visit "/"
  fill_in 'user[username]', with: 'MrAdmin'
  fill_in 'user[name]', with: 'Admin'
  fill_in 'user[email]', with: 'admin@exchangeagram.com'
  fill_in 'user[password]', with: 'password'
  find('.submit-field input').click
end
