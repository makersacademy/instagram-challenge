def add_new_user(email = 'test@testing.com', password = '123456')
    visit('/')
    click_on('Register')
    fill_in('user_email', with: email)
    fill_in('user_password', with: password)
    fill_in('user_password_confirmation', with: password)
    click_on('Sign up')
end