require 'rails_helper'

feature 'user can sign up' do

  scenario 'valid input creates account' do
    visit "/users/sign_up"
    fill_in "User name", with: "Gulliver"
    fill_in "Email", with: "gulliver@mail.com"
    fill_in 'user_password', with: "travels"
    fill_in 'user_password_confirmation', with: "travels"
    click_button "Sign up"
    expect{page}.not_to raise_error
  end

end
