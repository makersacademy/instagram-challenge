require 'rails_helper'

feature 'user can log out' do

  scenario 'signed in user clicks logout link' do
    visit "/users/sign_up"
    fill_in "User name", with: "Gulliver"
    fill_in "Email", with: "gulliver@mail.com"
    fill_in 'user_password', with: "travels"
    fill_in 'user_password_confirmation', with: "travels"
    click_button "Sign up"
    click_link "Logout"
    expect(page).to have_content("Login")
    end

end
