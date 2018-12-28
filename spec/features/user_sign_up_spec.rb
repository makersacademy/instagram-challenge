require 'rails_helper'

RSpec.feature "User sign up", type: :feature do
  scenario "User can sign up" do
    visit "/sign_up"
    fill_in "user_first_name", with: 'test'
    fill_in "user_last_name", with: 'user'
    fill_in "user_username", with: 'test'
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign Up"
    expect(current_path).to eq "/posts"
  end
end
