require 'rails_helper'

feature "Comments" do
  context "allows users to" do
    scenario "leave comments on images" do
      sign_up
      add_image
      click_link 'link_clingy_korok.jpg'
      fill_in :comment_text, with: "Haha, it has his hat!"
      click_button 'Create Comment'
      expect(page).to have_content("test")
      expect(page).to have_content("Haha, it has his hat!")
    end
  end
  context "does not allow users to" do
    scenario "comment as anyone but themselves" do
      sign_up
      add_image
      click_link 'Sign out'
      sign_up("rabbit@test.com", "password1")
      click_link 'link_clingy_korok.jpg'
      fill_in :comment_text, with: "Haha, it has his hat!"
      click_button 'Create Comment'
      expect(page).to have_content("rabbit")
      expect(page).not_to have_content("test")
    end
  end
end
