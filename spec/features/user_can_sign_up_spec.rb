require 'rails_helper'

RSpec.feature "Signing up", type: :feature do
  scenario "User can sign up with unique and valid email and password" do
    visit '/'
    click_link "Sign Up"
    fill_in "email", with: "arakno@makers.com"
    fill_in "password", with: "makers4L"
    fill_in "password_confirmation", with: "makers4L"
  end
  # scenario "User cannot sign up with unique and invalid email and password" do
  # end
  # scenario "User cannot sign up with non-unique and valid email and password" do
  # end
  # scenario "User cannot sign up with non-unique and invalid email and password" do
  # end
  # scenario "User cannot sign up with unique and valid email and invalid password" do
  # end
  # scenario "User cannot sign up with unique and valid email and password confirmation mismatch" do
  # end
end