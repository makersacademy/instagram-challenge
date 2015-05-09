require 'rails_helper'

feature 'Wesbite' do

  context 'on initialization' do

    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No Images Yet'
      expect(page).to have_link 'Upload Image'
    end
  end

  context 'when image has been added in the database' do

    before do
      Image.create(description: 'My face')
    end

    scenario 'will display image description' do
      visit '/images'
      expect(page).to have_content('My face')
      expect(page).not_to have_content('No Images Yet')
    end
  end

  context 'when user uploads images' do

    scenario 'prompts them to enter a description, then displays description' do
      visit '/images'
      click_link 'Upload Image'
      fill_in 'Description', with: 'My face'
      click_button 'Upload'
      expect(page).to have_content 'My face'
      expect(current_path).to eq '/images'
    end
  end

  context 'when user visits website' do

    let!(:myface){Image.create(description:'My face')}

    scenario 'lets them view images' do
      visit '/images'
      click_link 'My face'
      expect(page).to have_content 'My face'
      expect(current_path).to eq "/images/#{myface.id}"
    end
  end

  context 'editing image descriptions' do

    before {Image.create description: 'My face'}

    scenario 'let a user edit an image description' do
      visit '/images'
      click_link 'Edit My face'
      fill_in 'Description', with: 'My face again'
      click_button 'Update'
      expect(page).to have_content 'My face again'
      expect(current_path).to eq '/images'
    end
  end

  context 'deleting images' do

    before {Image.create description: 'My face'}

    scenario 'removes an image when a user clicks a delete link' do
      visit '/images'
      click_link 'Delete My face'
      expect(page).not_to have_content 'My face'
      expect(page).to have_content 'Image deleted successfully'
    end
  end
end
