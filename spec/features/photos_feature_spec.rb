require 'rails_helper'

describe 'photo features' do

  feature 'showing photos' do

    context 'no photos have been added' do
      scenario 'should display a prompt to add a photo' do
        visit '/photos'
        expect(page).to have_content 'No photos yet'
        expect(page).to have_link 'Upload a photo'
      end
    end

    context 'photos have been added' do
      let!(:photo) { create(:test_photo) }

      scenario 'display photos' do
        visit '/photos'
        expect(page).to have_xpath("//img[contains(@src, \"thumb/test.png\")]")
        expect(page).not_to have_content('No photos yet')
      end
    end
  end

  feature 'uploading photos' do

    scenario 'by submitting form' do
      visit '/photos'
      click_link 'Upload a photo'
      page.attach_file('Image', Rails.root + 'spec/images/test.png')
      click_button 'Post'
      expect(current_path).to eq '/photos'
      expect(Photo.first.image_file_name).not_to be_empty
    end
  end
end 
