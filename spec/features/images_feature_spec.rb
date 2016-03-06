require 'rails_helper'

# As an user
# So I can share my images
# I want to be able to upload an images

feature 'images' do

  context 'No images have been added yet' do

    scenario 'no images have been uploaded yet' do
      visit '/images'
      expect(page).to have_content 'No images have been uploaded yet!'
      expect(page).to have_content 'Add an Image'
    end
  end

  context 'Images have been added' do
    before do
      Image.create( title: 'Zonsondergang')
    end

    scenario 'images titles are shown' do
      visit '/images'
      expect(page).to have_content 'Zonsondergang'
    end
  end

  context 'Uploading an image' do
    # pending because creates file in public without dleting it
    xscenario 'users can upload an image' do
      visit '/images'
      click_link 'Add an Image'
      page.attach_file('image_image', Rails.root + 'spec/Fixtures/2005-spring39.jpg')
      fill_in 'Title', with: 'Zeekust'
      click_button 'Create Image'
      expect(current_path).to eq '/images'
      expect(page).to have_css("img[src*='thumb/2005-spring39.jpg']")
    end

    scenario 'users can add an title for the image' do
      visit '/images'
      click_link 'Add an Image'
      expect(current_path).to eq '/images/new'
      expect(page).to have_content 'Title'
    end

    scenario 'users sees added title on images page' do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Title', with: 'Zonsopgang'
      click_button 'Create Image'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Zonsopgang'
    end

    scenario 'users can add a description for the image' do
      visit '/images'
      click_link 'Add an Image'
      expect(page).to have_content 'Description'
    end

    scenario 'users sees added description for the image' do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Description', with: 'Een stukje kust in Zuid Italië'
      click_button 'Create Image'
      expect(page).to have_content 'Een stukje kust in Zuid Italië'
    end

    xscenario 'users can view image' do
      visit '/images'
      click_link 'Add an Image'
      page.attach_file('image_image', Rails.root + 'spec/Fixtures/2005-spring39.jpg')
      fill_in 'Title', with: 'Adratische kust'
      fill_in 'Description', with: 'Tussen Otranto en Porto Badisco'
      click_button 'Create Image'
      click_link 'View Image'
      expect(page).to have_css("img[src*='medium/2005-spring39.jpg']")

    end
  end

  context 'updating an image' do

    scenario 'users can change the title of an image' do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Title', with: 'Zeekust'
      click_button 'Create Image'
      click_link 'Edit Text'
      fill_in 'Title', with: 'Strand'
      click_button 'Update Image'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Strand'
    end

    scenario 'users can update the description of an image' do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Description', with: 'Een mooi plaatje'
      click_button 'Create Image'
      click_link 'Edit Text'
      fill_in 'Description', with: 'Het is nog mooier geworden'
      click_button 'Update Image'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Het is nog mooier geworden'
    end
  end

  context 'deleting an image' do

    xscenario 'users can delete an image' do
      visit 'images'
      click_link 'Add an Image'
      page.attach_file('image_image', Rails.root + 'spec/Fixtures/2005-spring39.jpg')
      fill_in 'Title', with: 'Zeekust'
      fill_in 'Description', with: 'Porto Badisco'
      click_button 'Create Image'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Zeekust'
      click_link 'View Image'
      click_link 'Delete Image'
      expect(page).to have_content 'Image deleted successfully'
    end
  end
end
