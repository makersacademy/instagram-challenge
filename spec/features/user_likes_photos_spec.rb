require "rails_helper"

RSpec.feature "Likes", type: :feature do
  scenario "User can like a post" do
    user_sign_up
    click_link "Add photo"
    attach_file "picture_image", "spec/assets/Totoro.jpg"
    fill_in "Caption", with: "Image 1"
    click_button "Create Picture"

    click_button "Like"

    expect(page).to have_content("1 like")
  end
end
