def sign_up_test(email: 'test@example.com', user_name: 'firstuser' )
    visit('/')
    click_link("Register")
    fill_in('Email', with: email)
    fill_in('User name', with: user_name)
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Create User')
end
