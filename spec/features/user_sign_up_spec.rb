require 'rails_helper'

describe "User Sign Up Page" do
  it "displays sign up form" do
    visit "/sign_up"
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Username")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
  end
end
