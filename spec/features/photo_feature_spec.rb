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
    visit '/photos'
    click_link 'Add a photo'
    fill_in 'photo[caption]', with: 'caption1'
    attach_file 'photo[image]', 'spec/assets/images/test.jpg'
    click_button 'Create Photo'
  end

    scenario 'should display photos and captions' do
      visit '/photos'
      expect(page).to have_content('caption1')
      expect(page).not_to have_content('No photos yet')
      expect(page).to have_css("img[src*='test']")
    end
  end
end



