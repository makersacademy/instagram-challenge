require 'rails_helper'

feature "posts are displayed on the index page" do
  scenario "several posts are displayed with images" do
    first_post = create(:post, description: "My first post")
    second_post = create(:post, description: "My second post")
    visit '/'
    expect(page).to have_content("My first post")
    expect(page).to have_content("My second post")
    expect(page).to have_css("img[src*='mum']")
  end
end
