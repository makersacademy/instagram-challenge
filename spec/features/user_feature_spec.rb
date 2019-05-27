require 'rails_helper'
require 'web_helper'

feature 'Users can sign up' do
  scenario 'user signs up for new account' do
    visit '/users/sign_up'
    fill_in 'user_user_name', with: 'Example Name'
    fill_in 'user_email', with: 'example@example.com'
    fill_in 'user_password', with: 'examplepassword'
    fill_in 'user_password_confirmation', with: 'examplepassword'
    click_button 'Sign up'

    expect(page).to have_content("Foodstagram")
  end
end

feature 'Users can log in' do
  scenario 'user who has not signed up yet cannot log in' do
    visit new_user_session_path
    fill_in 'user_email', with: 'example@example.com'
    fill_in 'user_password', with: 'examplepassword'
    click_button 'Log in'

    expect(page).to have_content("Log in")
  end

  scenario 'user with an account can log in' do
    visit new_user_session_path
    fill_in 'user_email', with: 'example@example.com'
    fill_in 'user_password', with: 'examplepassword'
    click_button 'Log in'

    expect(page).to have_content("Log in")
  end
end
