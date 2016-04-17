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
      sign_up
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

    scenario 'can be deleted' do
      visit '/photos'
      expect(page).to have_link 'Delete photo'
    end

    scenario 'users can delete their own photos' do
      visit '/photos'
      click_link 'Delete photo'
      expect(Photo.all.size).to eq 0
    end

    scenario 'users cannot delete others\' photos' do
      visit '/photos'
      click_link 'Sign out'
      sign_up(email: 'test2@example.com')
      visit '/photos'
      click_link 'Delete photo'
      expect(Photo.all.size).to eq 1
    end
  end
end



