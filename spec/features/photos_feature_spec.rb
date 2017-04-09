require 'rails_helper'

feature 'photos' do

  before :each do
    sign_up
  end

  context 'no photos have been added' do
    scenario 'should display a button to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end
  end

  context 'photos have been added' do
  before :each do
    add_photo
  end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content("Sunny :)")
      expect(page).to have_content("hello123")
      expect(page).not_to have_content('No photos yet')
    end


  context 'posting photos' do
    scenario 'allows user to upload photo, then displays photo' do
      add_photo
      expect(page).to have_content 'Sunny :)'
      expect(current_path).to eq '/photos'
    end
  end

  context 'editing restaurants' do

    scenario 'let a user edit a photo' do
      visit '/photos'
      click_link 'Edit'
      fill_in 'Caption', with: 'Picnic in the park'
      click_button 'Post photo'
      expect(page).to have_content 'Picnic in the park'
      expect(page).to have_content 'Hyde Park'
    end

  end

  context 'deleting photos' do

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/photos'
      click_link 'Delete'
      expect(page).not_to have_content 'Sunny :)'
    end
  end
end
end
