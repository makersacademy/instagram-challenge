def sign_up
    visit('/users/sign_up')
    fill_in :user_username, with: "dill"
    fill_in :user_email, with: "anemail@email.com"
    fill_in :user_password, with: "123456"
    fill_in :user_password_confirmation, with: "123456"
    click_button "Sign up"
end