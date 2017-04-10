require 'rails_helper'

feature "Pictures" do
  context "uploading" do
    scenario "can be added by users" do
      sign_up
      add_image
      expect(page).to have_content('Image uploaded successfully.')
    end
  end
  context "deleting" do
    scenario "can be deleted by users" do
      sign_up
      add_image
      click_link 'Delete picture'
      expect(page).to have_content('Image successfully deleted')
      expect(page).to have_content('There are no images to display')
    end
  end
end
