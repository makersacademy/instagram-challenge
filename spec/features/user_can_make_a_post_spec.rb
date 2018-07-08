require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_successfully

    visit "/posts/new"
    fill_in "Content", with: "Test text for message!"
    click_button "Create Post"
    expect(page).to have_content("Test text for message!")
  end
end
