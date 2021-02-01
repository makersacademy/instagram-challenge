require 'rails_helper'

RSpec.feature "Log In", type: :feature do
  before(:each) do
    user = User.create(username: "TestUser", email: "Test@example.com", password: "password")
  end

  scenario "a signed up user can log in" do
    visit '/'
    fill_in "Email", with: "Test@example.com"
    fill_in "Password", with: "password"
    click_button "Log In"
    expect(page).to have_text("Signed in successfully")
  end

  scenario "cannot log in with incorrect email" do
    visit '/'
    fill_in "Email", with: "Wrong@example.com"
    fill_in "Password", with: "password"
    click_button "Log In"
    expect(page).to have_content("Invalid Email or password")
  end

  scenario "cannot log in with incorrect password" do
    visit '/'
    fill_in "Email", with: "Test@example.com"
    fill_in "Password", with: "wrongpassword"
    click_button "Log In"
    expect(page).to have_content("Invalid Email or password")
  end
end
