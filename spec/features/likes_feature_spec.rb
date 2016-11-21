require 'rails_helper'

feature "Likes" do
  context "no likes" do
    scenario "there should initially be no likes on the page" do
      upload_picture
      visit '/pictures'
      expect(page).to have_content "Likes: 0"
    end
  end

  context "2 likes" do
    scenario "user can add likes" do
      upload_picture
      visit '/pictures'
      click_link "Like"
      expect(page).to have_content "Likes: 1"
      click_link "Like"
      expect(page).to have_content "Likes: 2"
    end
  end
end
