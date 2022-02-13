require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario("user can sign up") do
    visit('users/sign_up')
    fill_in "Name", with: "T. Estman"
    fill_in "Usernname", with: "Mr T"
    fill_in "Email", with: "t@testmail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("My Profile")
  end
end