require "rails_helper"

RSpec.feature "Log in", type: :feature do 
  scenario "A previous signed-up user can log in" do
    visit "/"
    click_link "SignUp"

    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"

    click_link "Log out"
    
    click_link "Login"

    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "123456"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end
end