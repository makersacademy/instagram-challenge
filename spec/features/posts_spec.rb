require 'rails_helper'

feature "Post" do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  before do
    login(user)
  end

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

  scenario "User can delete a post" do
    visit post_path(post)
    click_link('Edit')
    fill_in 'post[caption]', with: "test caption 2"
    click_on 'Post'
    expect(page).to have_content "test caption 2"
  end

end
