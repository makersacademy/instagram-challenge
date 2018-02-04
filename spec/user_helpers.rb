def sign_up
  visit('/users/sign_up')
    fill_in 'user_name', with: 'Tester'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'testing'
    fill_in 'password_confirmation', with: 'testing'
    click_button 'Sign up'
end

def login(user)
  visit("/users/sign_in")
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
end
