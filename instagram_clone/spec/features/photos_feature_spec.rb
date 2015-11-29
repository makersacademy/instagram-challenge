require 'rails_helper'

feature 'Photos' do

  context 'No photos are displayed' do

    it 'should display a link to add a restaurant' do
      visit '/photos'
      expect(page).to have_content('No photos yet :(')
      expect(page).to have_link('Upload Photo')
    end
  end

  context 'Uploading a photo' do
    it 'prompts a user to fill a form and upload a photo' do
      visit '/photos'
      click_link 'Upload Photo'
      fill_in :Caption, with: 'Cool'
      attach_file('Image', './spec/images/test1.jpg')
      click_button 'Create Photo'
      expect(page).to have_content('Cool')
      expect(page).to have_content('Picture uploaded')
    end
  end

  context 'Viewing a photo' do
    before do
      visit '/photos'
      click_link 'Upload Photo'
      fill_in :Caption, with: 'Cool'
      attach_file('Image', './spec/images/test1.jpg')
      click_button 'Create Photo'
    end

    let(:photo) { Photo.first }

    it 'lets a user view a photo' do
      find(:xpath, "//a[contains(@href,'photos/#{photo.id}')]").click
      expect(page).to have_content('Cool')
      expect(current_path).to eq "/photos/#{photo.id}"
    end
  end
end
