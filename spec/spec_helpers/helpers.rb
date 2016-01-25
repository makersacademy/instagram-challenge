def sign_in_as(user)
  visit '/'
  click_link 'Sign in'
  fill_in 'user[login]', with: user.email
  fill_in 'user[password]', with: user.password
  click_button 'Log in'
end

def sign_out
  find('#navbar a.dropdown-toggle').click
  click_link 'Sign out'
end
