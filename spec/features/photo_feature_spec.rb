require 'rails_helper'

feature 'photos' do
  context 'have not been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_content 'Add a photo'
    end
  end

  context 'have been added' do
    before do 
      Photo.create(caption: 'caption1') 
    end

    scenario 'should display photos captions' do
      visit '/photos'
      expect(page).to have_content('caption1')
      expect(page).not_to have_content('No photos yet')
    end

    scenario 'can add a caption for a photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'photo[caption]', with: 'caption2'
      click_link 'Upload'
      expect(page).to have_content('caption2') 
    end
  end
end


