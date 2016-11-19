require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do
    before { Image.create description: 'First picture', avatar_file_name: 'test.jpg' }

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content 'First picture'
      expect(page).not_to have_content 'No images yet'
    end
  end

  context 'adding images' do
    scenario 'prompts user to fill out form, then displays new image' do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Description', with: 'First picture'
      attach_file('file_field', "spec/test_files/images/test.jpg")
      click_button 'Create Image'
      expect(page).to have_content 'First picture'
      expect(page).to have_css("img[src*='test.jpg']")
      # expect(page).to have_image
    end
  end

  context 'viewing images' do
    scenario 'lets a user view an image' do
      visit '/images/1'
      expect(page).to have_image
      expect(current_path).to eq '/images/#{}'
    end
  end

  context 'editing images' do

    before { Image.create description: 'First picture', avatar_file_name: 'test.jpg' }

    scenario 'lets user edit their image description' do
      visit '/images'
      click_link 'Edit description'
      fill_in 'Description', with: 'Lovely picture'
      click_button 'Update Image'
      expect(page).to have_content 'Lovely picture'
      expect(page).not_to have_content 'First picture'
      expect(current_path).to eq '/images'
    end
  end

  context 'deleting images' do

    before { Image.create description: 'First picture', avatar_file_name: 'text.jpg' }

    scenario 'lets user delete their image' do
      visit '/images'
      click_link 'Delete image'
      expect(page).to have_content 'Image deleted successfully'
      expect(page).not_to have_content 'First picture'
    end
  end
end
