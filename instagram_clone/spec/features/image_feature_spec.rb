require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload an image'
    end
  end

  context 'creating posts' do
    scenario 'adds the image to the homepage' do
      attach_file 'Picture', Rails.root.join('spec/images/cake.jpg')
      expect(page).to have_css 'img.uploaded-pic'
    end
  end
end
