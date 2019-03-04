require 'rails_helper'

RSpec.feature "On signing up", type: :feature do
  scenario "clicking Sign up with empty fields gives an error" do
    visit "/users/sign_up"
    fill_in "user[email]", with: ""
    fill_in "user[password]", with: ""
    fill_in "user[password_confirmation]", with: ""
    click_button ("Sign up")
    expect(page).to have_content("3 errors prohibited this user from being saved:")
  end

  scenario "successfully user is redirected to posts page" do
    visit "/users/sign_up"
    fill_in "user[user_name]", with: "user1"
    fill_in "user[email]", with: "user1@email.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button ("Sign up")
    expect(page).to have_content("Exit")
  end
end
