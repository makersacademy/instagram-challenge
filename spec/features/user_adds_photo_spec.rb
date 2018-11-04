require 'rails_helper'

RSpec.feature "Add photo", type: :feature do

  scenario "User can add a photo" do
    visit "/users/sign_up"
    fill_in "user_username", with: "Lazy"
    fill_in "user_email", with: "12@23.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"

    click_link "Add photo"

    expect(page).to have_content("Image")
  end
end
