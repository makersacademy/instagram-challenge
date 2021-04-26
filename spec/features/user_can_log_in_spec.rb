require 'rails_helper'

RSpec.feature "LogIn", type: :feature do
  scenario "User can log in to shminstagram" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "Nata11"
    fill_in "Password", with: "Password11"
    fill_in "Password confirmation", with: "Password11"
    click_button "Sign Up"
    click_link "Log Out"
    click_link "Log In"
    fill_in "Usename", with: "Nata11"
    fill_in "Password", with: "Password11"
    click_button "Log In"
    expect(page).to have_content("Hello, Nata11!")
  end
end