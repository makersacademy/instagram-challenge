def sign_up
  visit('/users/sign_up')
  within(:css, 'form.new_user') do
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_first_name', with: 'Tester'
    fill_in 'user_last_name', with: 'Testing'
    fill_in 'user_user_name', with: 'test'
    fill_in 'user_password', with: 'testing'
    fill_in 'user_password_confirmation', with: 'testing'
    click_button 'Sign up'
  end
end

def login(user)
  visit("/users/sign_in")
  within(:css, 'form.new_user') do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end
end
