require 'rails_helper'

feature 'Images' do

  before do
    sign_up_and_sign_in
  end

  context 'Website on initialization' do

    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No Images Yet'
      expect(page).to have_link 'Upload Image'
    end
  end

  context 'when image has been added in the database' do

    before do
      create_an_image
    end

    scenario 'will display image description' do
      visit '/images'
      expect(page).to have_content('My face')
      expect(page).not_to have_content('No Images Yet')
    end
  end

  context 'when user uploads images' do

    scenario 'prompts them to enter a description, then displays description' do
      create_an_image
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

    before do
      create_an_image
    end

    scenario 'let a user edit an image description' do
      visit '/images'
      click_link 'Edit'
      fill_in 'Description', with: 'My face again'
      click_button 'Update'
      expect(page).to have_content 'My face again'
      expect(current_path).to eq '/images'
    end
  end

  context 'deleting images' do

    before do
      create_an_image
    end

    scenario 'removes an image when a user clicks a delete link' do
      visit '/images'
      click_link 'Delete'
      expect(page).not_to have_content 'My face'
      expect(page).to have_content 'Image deleted successfully'
    end

    scenario 'only works if image was uploaded by current user' do
      sign_out
      sign_up_and_sign_in({ email: "sanj@sanj.com" })
      click_link 'Delete'
      expect(page).to have_content 'Not your image'
      expect(page).to have_content 'My face'
    end
  end
end
