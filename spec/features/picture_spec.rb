require 'rails_helper'

feature "Pictures" do

  context "user should be able to upload pictures" do

    scenario do
      visit '/pictures'
      expect(page).to have_content "Add a new pik"
      click_link "Add a new pik"
      page.attach_file('image_upload', Rails.root + '/spec/features/test.png')
      click_button 'Upload'
      expect(current_path).to eq '/pictures'
    end
  end
end
