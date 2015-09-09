require 'rails_helper'

feature 'liking posts', js: true do
  before(:each) do
    user = build(:user)
    sign_up user
    click_link "Make a post"
    fill_in "Title", with: "I love cheese"
    attach_file("post[image]", "spec/assets/images/KFC.jpg")
    click_button "Post"
  end

  scenario 'users can like a post, which updates the like count' do
    click_link "Like"
    expect(page).to have_content "1 Like"
  end

  scenario 'user can only like post once' do
    click_link "Like"
    click_link "Like"
    expect(page).to have_content "1 Like"
  end

  context "on post page" do
    scenario 'users can like a post, which updates the like count' do
      # find("img[alt='Kfc']").click
      visit "/posts/1"
      click_link "Like"
      expect(page).to have_content "1 Like"
    end

    scenario 'user can only like post once' do
      # find("img[alt='Kfc']").click
      visit "/posts/1"
      expect(page).to have_content "0 Likes"
      click_link "Like"
      click_link "Like"
      expect(page).to have_content "1 Like"
    end
  end
end