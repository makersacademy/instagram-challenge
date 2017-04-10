require 'rails_helper'

feature "Likes" do
  context "users can like pictures" do
    scenario "by clicking the 'like' button" do
      sign_up
      add_image
      click_link 'link_clingy_korok.jpg'
      click_link 'Like'
      expect(page).to have_content("1 Like")
    end
  end
end
