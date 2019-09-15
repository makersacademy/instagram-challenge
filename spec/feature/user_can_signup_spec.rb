require "rails_helper"

RSpec.feature "Sign up", type: :feature do
  scenario "Can Sign up" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    expect(page).to have_current_path("/")
  end
  end


  