require 'rails_helper'

feature "likes" do
  context "A user would like to 'like' an image" do
    it "Likes an image" do
      sign_up
      capybara
      visit '/'
      click_button "Like"
      expect(page).to have_content("Likes: 1")
    end
  end
end
