require 'rails_helper'
require 'capybara/rspec'

feature "sign up", type: :feature do

  scenario "user signs up sucessfully" do
    signup_as_new_user("Josh")
    expect(page).to have_content("You have successfully signed up")
  end

  scenario "users creating account with duplicate username throws error message" do
    signup_as_new_user("Josh")
    signup_as_new_user("Josh")
    expect(page).to have_content("Username has already been taken")
  end

  scenario "users creating account with 4 character password throws error message" do
    visit "/"
    click_button "Create Account"
    fill_in "user[username]", with: "Josh"
    fill_in "user[password]", with: "pas"
    fill_in "user[email]", with: "josh@gmail.com"
    click_button "Create Account"
    expect(page).to have_content("too short")
  end

  scenario "users creating account with more than 10 character password throws error message" do
    visit "/"
    click_button "Create Account"
    fill_in "user[username]", with: "Josh"
    fill_in "user[password]", with: "myverylongpassword"
    fill_in "user[email]", with: "josh@gmail.com"
    click_button "Create Account"
    expect(current_path).to eq("/users")
    expect(page).to have_content("too long")
  end

end
