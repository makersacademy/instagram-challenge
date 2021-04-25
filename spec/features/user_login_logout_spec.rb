require 'rails_helper'

RSpec.feature "login", type: :feature do
  scenario "User can login" do
    sign_up
    click_link "Log Out"
    click_link "Log In"
    fill_in "Username", with: "test_user"
    fill_in "Password", with: "test_password"
    click_button "Log In"
    expect(page).to have_content("test_user")
  end

  scenario "User cannot login with a wrong password" do
    sign_up
    click_link "Log Out"
    click_link "Log In"
    fill_in "Username", with: "test_user"
    fill_in "Password", with: "test_pass"
    click_button "Log In"
    expect(page).to have_content("Email or password is invalid")
  end
end

RSpec.feature "Logout", type: :feature do
  scenario 'Can log out when logged in' do
    sign_up
    click_link "Log Out"
    expect(page).to have_content("Log In")
  end
end
