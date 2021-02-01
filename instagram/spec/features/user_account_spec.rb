require 'rails_helper' 

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up to make an account" do
    visit "/users"
    click_link "Sign Up"
    fill_in "user[email]", with: "mrtester@test.com"
    fill_in "user[password]", with: "test123"
    click_button "Sign Up"
    expect(page).to have_content("Logged in as: mrtester@test.com")
  end 

  scenario "Can successfully log in" do
    visit "/users"
    click_link "Sign Up"
    fill_in "user[email]", with: "mrtester@test.com"
    fill_in "user[password]", with: "test123"
    click_button "Sign Up"
    click_link "Log Out"
    click_link "Log In"
    fill_in "Email", with: "mrtester@test.com"
    fill_in "Password", with: "test123"
    click_button "Log In"
    expect(page).to have_content("Logged in as: mrtester@test.com")
  end 

end
