require 'rails_helper'

feature 'posts' do
  context 'no images have been added' do
    scenario 'should display a prompt to add a  photo' do
      visit '/posts'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photo has been uploaded' do
    before do
      Post.create(title: 'Vacation')
    end

    scenario 'display photos' do
      visit '/posts'
      expect(page).to have_content 'Vacation'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'uploading a photo' do
    scenario 'prompts a user to fill out a for and then displays the photo' do
      visit '/posts'
      click_link 'Add a photo'
      fill_in 'Title', with: 'Vacation'
      click_button 'Upload photo'
      expect(page).to have_content 'Vacation'
      expect(current_path).to eq '/posts'
    end
  end

end
