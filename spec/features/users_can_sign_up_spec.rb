require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario "A user can register with their email address" do
    visit "/"
    click_link "SignUp"

    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end