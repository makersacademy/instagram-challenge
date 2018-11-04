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
    attach_file "picture_image", "spec/assets/Totoro.jpg"
    fill_in "Caption", with: "Image 1"
    click_button "Create Picture"

    click_link "Add photo"
    attach_file "picture_image", "spec/assets/Totoro.jpg"
    fill_in "Caption", with: "Image 2"
    click_button "Create Picture"

    expect(page).to have_content("Image 1")
    expect(page).to have_content("Image 2")
  end
end
