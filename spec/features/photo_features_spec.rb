require 'rails_helper'

feature 'Photos' do
  context 'No photos have been added' do
    scenario 'Displays a prompt to add a photo' do
      visit '/photos'
      sign_up
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'Photos have been added' do
    before do
      Photo.create(file: 'test.jpg')
    end

    scenario 'Display photos' do
      visit '/photos'
      sign_up
      expect(page).to have_content('test.jpg')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'Adding photos' do
    scenario 'Prompts users to fill out a form with the filename and attach an image for upload' do
      sign_up
      add_photo
      expect(page).to have_content 'Test'
      expect(page).to have_content :thumb
    end
  end

  context 'Viewing photos' do
    let!(:test1) {Photo.create(file: 'test')}

    scenario 'Lets a user view a photo' do
      sign_up
      click_link 'test'
      expect(page).to have_content :medium
      expect(current_path).to eq "/photos/#{test1.id}"
    end
  end
end
