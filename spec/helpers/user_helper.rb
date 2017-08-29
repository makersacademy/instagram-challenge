def sign_up(first_name: 'Alice',
            last_name: 'Tester',
            username: 'owlface123',
            email: 'alice@alice.com',
            password: '123456',
            password_confirmation: '123456')
  visit '/'
  click_link 'Sign up'
  fill_in 'user[first_name]', with: first_name
  fill_in 'user[last_name]', with: last_name
  fill_in 'user[username]', with: username
  fill_in 'user[email]' , with: email
  fill_in 'user[password]', with: password
  fill_in 'user[password_confirmation]', with: password_confirmation
  click_button 'Sign up'
end
