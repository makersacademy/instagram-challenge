require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario "User can sign up to shminstagram" do
    visit "/users"
    click_link "Sign Up"
    fill_in "Username", with: "Nata11"
    fill_in "Password", with: "Password11"
    fill_in "Password confirmation", with: "Password11"
    click_button "Sign Up"
    expect(page).to have_content("Hello, Nata11!")
  end
end