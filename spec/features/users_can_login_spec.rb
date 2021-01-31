require 'rails_helper'
require_relative 'sign_up_helper_spec'

RSpec.feature "Login", type: :feature do
  scenario "User can login" do
    sign_up_kiki
    click_button "Logout"
    click_button "Login"
    fill_in "username", with: "Kiki"
    fill_in "password", with: "password"
    click_button "Login"
    expect(current_path).to eq root_path
    expect(page).to have_content "You are logged in as Kiki"
  end

  scenario "User cannot login with wrong username" do
    sign_up_kiki
    click_button "Logout"
    click_button "Login"
    fill_in "username", with: "K"
    fill_in "password", with: "password"
    click_button "Login"
    expect(current_path).to eq login_path
    expect(page).not_to have_content "You are logged in as Kiki"
  end

  scenario "User cannot login with wrong password" do
    sign_up_kiki
    click_button "Logout"
    click_button "Login"
    fill_in "username", with: "Kiki"
    fill_in "password", with: "pass"
    click_button "Login"
    expect(current_path).to eq login_path
    expect(page).not_to have_content "You are logged in as Kiki"
  end
end
