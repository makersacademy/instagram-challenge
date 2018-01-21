require 'rails_helper'

feature "Post" do
  let!(:post) {create(:post, caption: "test caption")}
  scenario "User can see Instagram's homepage" do
    visit '/'
    expect(page).to have_content "Instagram"
  end

  scenario "User can post an image with caption" do
    visit post_path(post)
    expect(page).to have_content "test caption"
    expect(page).to have_css("img[src*='greatview']")
  end

  scenario "User can delete a post" do
    visit post_path(post)
    click_link('Delete')
    expect(page).not_to have_content "test caption"
    expect(page).not_to have_css("img[src*='greatview']")
  end

end
