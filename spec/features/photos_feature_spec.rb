require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a link to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'a photo can be added' do
    scenario 'user can upload and view a photo' do
      visit '/photos'
      click_link 'Add a photo'
      attach_file 'Image', Rails.root.join('spec','features','img.jpg')
      click_button 'Create Photo'
      expect(page).to have_css("img[src*='img.jpg']")
    end
  end

end
