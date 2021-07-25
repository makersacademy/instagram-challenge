require 'rails_helper'

RSpec.feature "User Sign In", type: :feature do
  fixtures :users
  let(:user) { users(:cynthia) }

  scenario "Log in with invalid information" do
    visit signin_path
    fill_in 'Email', with: ""
    fill_in 'Password', with: ""
    click_button "Log in"

    expect(page).to have_content('Invalid email/password combination')
  end

  scenario "Log in with valid information" do
    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button "Log in"

    expect(page).to have_content("#{user.name}")
  end

  scenario "Log in with valid information followed by log out" do
    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button "Log in"
    click_link "Sign out"

    expect(page).to have_content("Sign in")
    expect(page).not_to have_content("Sign out")
    expect(page).to have_content("You have logged out.")
  end
end
