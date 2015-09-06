require 'rails_helper'

feature 'Image upload' do
  context 'no images have been uploaded' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload'
    end
  end

  context 'restaurants have been added' do
    before do
      Image.create(title: 'Great view')
    end

    scenario 'display restaurants' do
      visit '/images'
      expect(page).to have_content('Great view')
      expect(page).not_to have_content('No images yet')
    end
  end
end