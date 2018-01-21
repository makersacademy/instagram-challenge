require 'rails_helper'

feature "Post" do
  scenario "User can see Instagram's homepage" do
    visit '/'
    expect(page).to have_content "Instagram"
  end

  scenario "User can post an image with caption" do
    post = create(:post)
    visit "/posts"
    expect(page).to have_content "test caption"
    expect(page).to have_css("img[src*='greatview']")
  end

end
