require 'rails_helper'

RSpec.feature "Add photo", type: :feature do

  scenario "User can add a photo" do
    user_sign_up

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
