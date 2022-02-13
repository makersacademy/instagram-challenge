require 'rails_helper'
require 'web_helpers/user_signup'


RSpec.feature "Edit profile", type: :feature do
  scenario("user can edit name") do
    user_sign_up
    visit('users/1')
    click_link "My Profile"
    click_link "Edit Profile"
    fill_in "user_name", with: "test name"
    click_button "Submit"
    expect(page).to have_content("test name")
  end

  scenario("user can username") do
    user_sign_up
    visit('users/1')
    click_link "My Profile"
    click_link "Edit Profile"
    fill_in "user_usernname", with: "test username"
    click_button "Submit"
    expect(page).to have_content("test username")
  end

  scenario("user can edit username") do
    user_sign_up
    visit('users/1')
    click_link "My Profile"
    click_link "Edit Profile"
    fill_in "user_usernname", with: "test username"
    click_button "Submit"
    expect(page).to have_content("test username")
  end

  scenario("user can add/edit bio") do
    user_sign_up
    visit('users/1')
    click_link "My Profile"
    click_link "Edit Profile"
    fill_in "user_bio", with: "test user bio"
    click_button "Submit"
    expect(page).to have_content("test user bio")
  end
end
