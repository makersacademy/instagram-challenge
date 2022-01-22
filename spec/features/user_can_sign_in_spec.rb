require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User lands on homepage when visiting site" do
    visit "/"
    click_link "Sign up"
    fill_in "user[name]", with: "Kim"
    fill_in "user[email]", with: "kim@kim.com"
    fill_in "user[username]", with: "kim_morgan"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Create User"
    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Account created!")
  end
end