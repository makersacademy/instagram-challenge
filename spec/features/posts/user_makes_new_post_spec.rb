require 'rails_helper'

RSpec.feature "Make new posts" do
  scenario "user can make new posts" do
    sign_in
    click_link "New Post"
    expect(current_path).to eq("/posts/new")
    fill_in "post_caption", with: "Lorem Ipsum"
    # click_button "Choose file"
    # fill_in "post_image", with: "ipsum.img"
    # click_button "Submit"
    # expect(page).to have_content("Lorem Ipsum")
  end
end
