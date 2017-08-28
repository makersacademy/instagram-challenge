require 'rails_helper'

RSpec.feature "User", type: :feature do
  let!(:user) { create(:user) }

  scenario "User can create a post" do
    sign_up
    visit "/posts"
    click_link "Create post"
    fill_in "post_caption", with: "Testing"
    click_button "Submit"
    expect(page).to have_content "Testing"
  end

  scenario "Created posts are displayed in reverse order" do
    create_post
    click_link "Create post"
    fill_in "post_caption", with: "Testing2"
    click_button "Submit"
    expect("Testing2").to appear_before("Testing1")
  end
end
