require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "When user clicks the add post image" do
    sign_up_successfully

    visit "/posts/new"
    fill_in "Content", with: "Test text for message!"
    click_button "Create Post"

    expect(current_path).to eq root_path
    expect(page).to have_content("Test text for message!")
  end
end
