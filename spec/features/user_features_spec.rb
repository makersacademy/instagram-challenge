require 'rails_helper'

RSpec.feature "Create a post", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New Post"
    fill_in "post[title]", with: "Test!"
    click_button "Create Post"
    expect(page).to have_content("Test!")
  end
end

RSpec.feature "Show indyvidual posts", type: :feature do
  scenario "Can see indyvidual posts" do
    visit "/posts"
    click_link "New Post"
    fill_in "post[body]", with: "Test!"
    click_button "Create Post"
    click_link "Show"
    expect(page).to have_content("Test!")
  end
end
