require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    it 'prompts a user to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures to display'
      expect(page).to have_link 'Add picture'
    end

    scenario 'user can add a picture that is then displayed' do
      visit '/pictures'
      click_link 'Add picture'
      attach_file 'picture_image', Rails.root + 'spec/features/test.jpg'
      fill_in 'Caption', with: 'First pic'
      click_button 'Upload picture'
      expect(page).to have_selector("img[src*=test]")
    end
  end
end
