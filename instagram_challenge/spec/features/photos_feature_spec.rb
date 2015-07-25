require 'rails_helper'

feature 'photos' do
  context 'no photos have been uploaded' do
    scenario 'displays a link to add photos' do
      visit '/'
      expect(page).to have_content 'No photos have been uploaded!'
      expect(page).to have_link 'Upload Photo'
    end


    context 'uploading images' do
      scenario 'uploading an image' do
        visit '/'
        click_link 'Upload Photo'
        attach_file 'Image', 'spec/features/Ice.jpg'
        fill_in 'Caption', with: 'awesome'
        click_button 'Upload Photo'
        expect(page).to have_css("img[src*='Ice.jpg']")
        expect(page).to have_content 'awesome'
        expect(current_path).to eq '/photos'
      end

    context 'viewing individual pictures' do
      scenario 'lets a user view a picture' do
        visit '/'
        click_

      end

    end

    end

  end


end
