require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_successfully

    visit root_path
    click_link 'New Post'
    fill_in "Content", with: "Test text for message!"
    click_button "Create Post"
    expect(page).to have_content("Test text for message!")
  end

  scenario "error if text is over 140 characters" do
    sign_up_successfully

    visit root_path
    click_link 'New Post'
    fill_in "Content", with: "This message is definitely over 140 characters. This message is
      definitely over 140 characters. This message is definitely over 140 characters.
      This message is definitely over 140 characters. This message is definitely over 140 characters.
      This message is definitely over 140 characters."
    click_button "Create Post"
    expect(page).to have_content("Content is too long")
  end
end
