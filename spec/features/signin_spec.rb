require 'rails_helper'

RSpec.feature "User Login", :type => :feature do
  scenario 'A signed up user can sign in' do
    register_user
    click_link "Logout"
    fill_in "Email", with: "joeb@hotmail.com"
    fill_in "Password", with: "secret"
    click_button "Log In"
    expect(page).to have_content "Signed in successfully"
  end
end
