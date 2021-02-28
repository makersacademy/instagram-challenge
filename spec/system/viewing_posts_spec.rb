require 'rails_helper'

RSpec.describe "ViewingPosts", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "user can see everyone's posts on the home page after logging in" do
    visit "/"
    click_on "Sign up"
    fill_in "user_email", with: DEFAULT_EMAIL
    fill_in "user_password", with: DEFAULT_PASSWORD
    fill_in "user_password_confirmation", with: DEFAULT_PASSWORD
    click_button "Sign up"

    find("#new_post").click
    attach_file("post_image", Rails.root + "spec/support/test_image.jpg")
    click_button "Create Post"
    expect(current_path).to eq "/"
    expect(page).to have_css("img[src*='test_image.jpg']")
  end
end
