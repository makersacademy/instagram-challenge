require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can comment on a post and view the comment" do
    visit "/posts"
    click_link "New Post"
    fill_in "Title", with: "Hello, world!"
    click_button "Create Post"
    click_link "Hello, world!"
    fill_in "comment[body]", with: "This is a comment"
    click_button "Create Comment"
    expect(page).to have_content("This is a comment")
  end
end
