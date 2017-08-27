def login(user)
  visit("/users/sign_in")
  within(:css, 'form.new_user') do
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end
end
