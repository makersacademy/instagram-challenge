require 'rails_helper'

RSpec.feature "Signing up", type: :feature do
  scenario "User can click on link to sign up form" do 
    visit '/'
    click_link "Sign up"
    expect(page).to have_content("Sign up")
  end
  scenario "User can sign up with unique and valid email and password" do
    visit '/'
    sign_up("arakno", "Arabella Knowles", "arakno@makers.com", "makers4L", "makers4L")
    expect(page).to have_content("Successfully signed in")
  end
  scenario "User cannot sign up with unique, invalid email and valid password" do
    visit '/'
    sign_up("arakno", "Arabella Knowles", "araknomakers.com", "makers4L", "makers4L")
    expect(page).to have_content("Email is invalid")
  end
  scenario "User cannot sign up with non-unique, valid email and valid password" do
    visit '/'
    sign_up("arakno", "Arabella Knowles", "arakno@makers.com", "makers4L", "makers4L")
    click_link "Sign out"
    sign_up("araknows", "Arabella Nowles", "arakno@makers.com", "bakers4L", "bakers4L")
    expect(page).to have_content("Email has already been taken")
  end
  scenario "User cannot sign up with unique, valid email and invalid password" do
    visit '/'
    sign_up("araknows", "Arabella Nowles", "arakno@makers.com", "mak", "mak")
    expect(page).to have_content("Password is too short")
  end
  scenario "User cannot sign up with unique, valid email and password confirmation mismatch" do
    visit '/'
    sign_up("araknows", "Arabella Nowles", "arakno@makers.com", "makers", "makers2")
    expect(page).to have_content("Password confirmation doesn't match")
  end
  scenario "user cannot sign up with non-unique username" do
    visit '/'
    sign_up("araknows", "Arabella Nowles", "arakno@makers.com", "makers", "makers")
    click_link "Sign out"
    sign_up("araknows", "Arabell Nowles", "arano@makers.com", "makeers", "makeers")
    expect(page).to have_content("Username has already been taken")
  end
end