require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "You can sign in" do
    visit "/accounts/sign_up"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Username", with: "Testy"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
    click_button "Logout"
    expect(page).to have_content("Log in")
  end
end
