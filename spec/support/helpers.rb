module Helpers
  def sign_in
    User.create(first_name: 'first name', last_name: 'last name', username: 'username', email: 'user@email.com', password: 'password')
    visit '/'
    click_on 'Sign in'
    fill_in 'user[username]', with: 'username'
    fill_in 'user[password]', with: 'password'
    click_on 'Log in'
  end
end