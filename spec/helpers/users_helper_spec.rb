def sign_up_test(email: 'test1@hotmail.com', user_name: 'test1' )
    visit('/')
    click_link("Register")
    fill_in('Email', with: email)
    fill_in('User name', with: user_name)
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')
end