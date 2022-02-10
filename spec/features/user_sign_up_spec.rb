require 'rails_helper'

RSpec.feature "UserSignUps", type: :feature do 
  scenario "a valid signup" do
    visit users_new_path
    fill_in("username", with: "Kate")
    fill_in("password", with: "123")
    click_button "Sign up"
    expect(page).to have_content "Thanks for signing up"
  end
end
