require 'rails_helper'



RSpec.feature "Login", type: :feature do


  def user_sign_up
    visit "/users/sign_up"
    fill_in "user_email", with: "jordan@matt.com"
    fill_in "user_password", with: "123456abc"
    fill_in "user_password_confirmation", with: "123456abc"
    click_button "Sign up"
  end

  scenario "The user can sign up successfully" do
    user_sign_up
    expect(page).to have_content("Signup successful, welcome jordan@matt.com")
  end

  scenario "The user does not enter valid signup credentials and an error message is displayed" do
    visit "/users/sign_up"
    fill_in "user_email", with: "jordan@matt.com"
    click_button "Sign up"
    expect(page).to have_content("Password can't be blank")
  end

  scenario "The user is not allowed to log in if they have not signed up" do
    visit "/"
    click_link "Login"
    fill_in "user_email", with: "register@instagram.com"
    fill_in "user_password", with: "thisismypassword123"
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")

  end
end
