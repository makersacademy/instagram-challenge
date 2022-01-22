require 'rails_helper'

RSpec.feature "Log out", type: :feature do
  scenario "User can log out" do
    user_sign_up
    log_in
    click_link "New post"
    fill_in "post[caption]", with: "My breakfast"
    page.attach_file(Rails.root + 'spec/test_pics/food_pic.jpeg')
    click_button "Create Post"
    expect(page).to have_content("kim_morgan")
    expect(page).to have_content("My breakfast")
    expect(page).to have_image
  end
end